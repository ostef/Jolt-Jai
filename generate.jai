// Jolt Physics v5.6.0 via JoltC interface using JoltC-BindGen

// To compile Jolt Physics and JoltC run `jai generate.jai - build`
// To compile as a shared library use the combined_shared_libs option

#run {
    set_build_options_dc(.{do_output=false});

    build_joltc := false;
    shared_libs := false;
    combined_shared_libs := false;
    build_type := "Debug";

    args := get_build_options().compile_time_command_line;
    for args {
        if it == {
        case "build";
            build_joltc = true;
        case "shared_libs";
            shared_libs = true;
        case "combined_shared_libs";
            combined_shared_libs = true;
        case "build_debug";
            build_type = "Debug";
        case "build_release";
            build_type = "Release";
        case "build_distribution";
            build_type = "Distribution";
        }
    }

    if build_joltc && !BuildJoltC(shared_libs, combined_shared_libs, build_type) {
        compiler_set_workspace_status(.FAILED);
        return;
    }

    if !GenerateBindings(shared_libs, combined_shared_libs) {
        compiler_set_workspace_status(.FAILED);
        return;
    }
}

GenerateBindings :: (shared_libs : bool, combined_shared_libs : bool) -> bool {
    result : string;

    {
        working_dir := get_working_directory();
        defer set_working_directory(working_dir);

        set_working_directory(tprint("%/Source/JoltC-BindGen", working_dir));

        if run_command("cmake", "-B", ".build").exit_code != 0 {
            return false;
        }

        if run_command("cmake", "--build", ".build").exit_code != 0 {
            return false;
        }

        bindgen_status, bindgen_result, bindgen_error := run_command(".build/joltc-bindgen", "../JoltC/JoltC.h", "-l", "jai", "-I", "../JoltC", capture_and_return_output=true);
        if bindgen_status.exit_code != 0 {
            log_error("joltc-bindgen failed:\n%", bindgen_error);
            return false;
        }

        result = bindgen_result;
    }

    result = sprint("COMBINED_SHARED_LIBS :: %1;\n\n%2", combined_shared_libs, result);
    write_entire_file("jolt.jai", result);

    return true;
}

BuildJoltC :: (build_shared_libs : bool, build_combined_shared_libs : bool, build_type : string) -> bool {
    {
        working_dir := get_working_directory();
        defer set_working_directory(working_dir);

        set_working_directory(tprint("%/Source/JoltC", working_dir));

        if run_command("rm", "-rf", ".build").exit_code != 0 {
            return false;
        }

        configure : [..]string;
        array_add(*configure, "cmake", "-B", ".build");
        array_add(*configure, tprint("-DBUILD_SHARED_LIBS=%", ifx build_shared_libs then "ON" else "OFF"));
        array_add(*configure, tprint("-DJOLTC_BUILD_COMBINED_SHARED_LIBS=%", ifx build_combined_shared_libs then "ON" else "OFF"));
        array_add(*configure, tprint("-DCMAKE_BUILD_TYPE=%", build_type));

        configure_str : string;
        for configure {
            if it_index > 0 {
                configure_str = sprint("% ", configure_str);
            }
            configure_str = sprint("%%", configure_str, it);
        }

        log("Running: %", configure_str);

        if run_command(..configure).exit_code != 0 {
            return false;
        }

        num_jobs := max(get_number_of_processors(.ALL_LOGICAL) - 1, 2);

        build : [..]string;
        array_add(*build, "cmake", "--build", ".build", tprint("-j%", num_jobs));

        build_str : string;
        for build {
            if it_index > 0 {
                build_str = sprint("% ", build_str);
            }
            build_str = sprint("%%", build_str, it);
        }

        log("Running: %", build_str);

        if run_command(..build).exit_code != 0 {
            return false;
        }
    }

    log("Copying library files");

    #if OS == .WINDOWS {
        // Purge the lib directory because files with different configuration conflict each other
        if run_command("rm", "-rf", "Libs/Windows").exit_code != 0 {
            return false;
        }

        make_directory_if_it_does_not_exist("Libs/Windows", recursive=true);

        if !build_combined_shared_libs {
            if !copy_file("Source/JoltC/.build/_deps/joltphysics-build/Debug/Jolt.lib", "Libs/Windows/Jolt.lib") {
                return false;
            }
            if !copy_file("Source/JoltC/.build/_deps/joltphysics-build/Debug/Jolt.pdb", "Libs/Windows/Jolt.pdb") {
                return false;
            }
            if build_shared_libs && !copy_file("Source/JoltC/.build/_deps/joltphysics-build/Debug/Jolt.dll", "Libs/Windows/Jolt.dll") {
                return false;
            }
        }

        if !copy_file("Source/JoltC/.build/Debug/JoltC.lib", "Libs/Windows/JoltC.lib") {
            return false;
        }
        if !copy_file("Source/JoltC/.build/Debug/JoltC.pdb", "Libs/Windows/JoltC.pdb") {
            return false;
        }
        if (build_shared_libs || build_combined_shared_libs) && !copy_file("Source/JoltC/.build/Debug/JoltC.dll", "Libs/Windows/JoltC.dll") {
            return false;
        }
    } else #if OS == .LINUX {
        // Purge the lib directory because files with different configuration conflict each other
        if run_command("rm", "-rf", "Libs/Linux").exit_code != 0 {
            return false;
        }

        make_directory_if_it_does_not_exist("Libs/Linux", recursive=true);

        if !build_shared_libs && !build_combined_shared_libs {
            if !copy_file("Source/JoltC/.build/_deps/joltphysics-build/libJolt.a", "Libs/Linux/libJolt.a") {
                return false;
            }
            if !copy_file("Source/JoltC/.build/libJoltC.a", "Libs/Linux/libJoltC.a") {
                return false;
            }
        } else {
            if !build_combined_shared_libs {
                if !copy_file("Source/JoltC/.build/_deps/joltphysics-build/libJolt.so", "Libs/Linux/libJolt.so") {
                    return false;
                }
            }

            if !copy_file("Source/JoltC/.build/libJoltC.so", "Libs/Linux/libJoltC.so") {
                return false;
            }
        }
    } else {
        #assert false "@Todo";
    }

    return true;
}

#import "System";
#import "Basic";
#import "Compiler";
#import "Process";
#import "Check";
#import "File";
#import "File_Utilities";
