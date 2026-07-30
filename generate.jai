// Jolt Physics v5.6.0 via JoltC interface using JoltC-BindGen

// To compile Jolt Physics and JoltC run `jai generate.jai - build`
// To compile as a shared library use the combined_shared_libs option

JoltFeatureFlags :: enum_flags {
    DoublePrecision;
    CrossPlatformDeterministic;
    FloatingPointExceptionsEnabled;
    ProfileEnabled;
    ExternalProfile;
    DebugRenderer;
    DisableTempAllocator;
    DisableCustomAllocator;
    ObjectLayer32Bits;
    EnableAsserts;
    ObjectStream;
}

#run {
    set_build_options_dc(.{do_output=false});

    build_joltc := false;
    shared_libs := false;
    combined_shared_libs := false;
    build_type := "Debug";
    jolt_features : JoltFeatureFlags;

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
        case "double_precision";
            jolt_features |= .DoublePrecision;
        case "cross_platform_deterministic";
            jolt_features |= .CrossPlatformDeterministic;
        case "floating_point_exceptions_enabled";
            jolt_features |= .FloatingPointExceptionsEnabled;
        case "profile_enabled";
            jolt_features |= .ProfileEnabled;
        case "external_profile";
            jolt_features |= .ExternalProfile;
        case "debug_renderer";
            jolt_features |= .DebugRenderer;
        case "disable_temp_allocator";
            jolt_features |= .DisableTempAllocator;
        case "disable_custom_allocator";
            jolt_features |= .DisableCustomAllocator;
        case "object_layer_32bits";
            jolt_features |= .ObjectLayer32Bits;
        case "enable_asserts";
            jolt_features |= .EnableAsserts;
        case "object_stream";
            jolt_features |= .ObjectStream;
        }
    }

    if build_joltc && !BuildJoltC(shared_libs, combined_shared_libs, build_type, jolt_features) {
        compiler_set_workspace_status(.FAILED);
        return;
    }

    if !GenerateBindings(shared_libs, combined_shared_libs, jolt_features) {
        compiler_set_workspace_status(.FAILED);
        return;
    }
}

GenerateBindings :: (shared_libs : bool, combined_shared_libs : bool, jolt_features : JoltFeatureFlags) -> bool {
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

        bindgen : [..]string;
        array_add(*bindgen, ".build/joltc-bindgen");
        array_add(*bindgen, "../JoltC/JoltC.h");
        array_add(*bindgen, "-l", "jai");
        array_add(*bindgen, "-I", "../JoltC");

        if jolt_features & .DoublePrecision {
            array_add(*bindgen, "-D", "JOLTC_DOUBLE_PRECISION");
        }
        if jolt_features & .CrossPlatformDeterministic {
            array_add(*bindgen, "-D", "JOLTC_CROSS_PLATFORM_DETERMINISTIC");
        }
        if jolt_features & .FloatingPointExceptionsEnabled {
            array_add(*bindgen, "-D", "JOLTC_FLOATING_POINT_EXCEPTIONS_ENABLED");
        }
        if jolt_features & .ProfileEnabled {
            array_add(*bindgen, "-D", "JOLTC_PROFILE_ENABLED");
        }
        if jolt_features & .ExternalProfile {
            array_add(*bindgen, "-D", "JOLTC_EXTERNAL_PROFILE");
        }
        if jolt_features & .DebugRenderer {
            array_add(*bindgen, "-D", "JOLTC_DEBUG_RENDERER");
        }
        if jolt_features & .DisableTempAllocator {
            array_add(*bindgen, "-D", "JOLTC_DISABLE_TEMP_ALLOCATOR");
        }
        if jolt_features & .DisableCustomAllocator {
            array_add(*bindgen, "-D", "JOLTC_DISABLE_CUSTOM_ALLOCATOR");
        }
        if jolt_features & .ObjectLayer32Bits {
            array_add(*bindgen, "-D", "JOLTC_OBJECT_LAYER_BITS=32");
        }
        if jolt_features & .EnableAsserts {
            array_add(*bindgen, "-D", "JOLTC_ENABLE_ASSERTS");
        }
        if jolt_features & .ObjectStream {
            array_add(*bindgen, "-D", "JOLTC_OBJECT_STREAM");
        }

        bindgen_status, bindgen_result, bindgen_error := run_command(..bindgen, capture_and_return_output=true);
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

BuildJoltC :: (build_shared_libs : bool, build_combined_shared_libs : bool, build_type : string, jolt_features : JoltFeatureFlags) -> bool {
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

        if jolt_features & .DoublePrecision {
            array_add(*configure, "-DJPH_DOUBLE_PRECISION=ON");
        }
        if jolt_features & .CrossPlatformDeterministic {
            array_add(*configure, "-DJPH_CROSS_PLATFORM_DETERMINISTIC=ON");
        }
        if jolt_features & .FloatingPointExceptionsEnabled {
            array_add(*configure, "-DJPH_FLOATING_POINT_EXCEPTIONS_ENABLED=ON");
        }
        if jolt_features & .ProfileEnabled {
            array_add(*configure, "-DJPH_PROFILE_ENABLED=ON");
        }
        if jolt_features & .ExternalProfile {
            array_add(*configure, "-DJPH_EXTERNAL_PROFILE=ON");
        }
        if jolt_features & .DebugRenderer {
            array_add(*configure, "-DJPH_DEBUG_RENDERER=ON");
        }
        if jolt_features & .DisableTempAllocator {
            array_add(*configure, "-DJPH_DISABLE_TEMP_ALLOCATOR=ON");
        }
        if jolt_features & .DisableCustomAllocator {
            array_add(*configure, "-DJPH_DISABLE_CUSTOM_ALLOCATOR=ON");
        }
        if jolt_features & .ObjectLayer32Bits {
            array_add(*configure, "-DJPH_OBJECT_LAYER_BITS=32");
        }
        if jolt_features & .EnableAsserts {
            array_add(*configure, "-DJPH_ENABLE_ASSERTS=ON");
        }
        if jolt_features & .ObjectStream {
            array_add(*configure, "-DJPH_OBJECT_STREAM=ON");
        }

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
