// Jolt Physics v5.6.0 via JoltC interface using JoltC-BindGen

// To compile Jolt Physics and JoltC run `jai generate.jai - build`
// To compile as a shared library use the combined_shared_libs option

JoltCompileOptions :: enum_flags {
    BuildTypeDebug;
    BuildTypeRelease;
    BuildTypeDistribution;
    SharedLibs;
    CombinedSharedLibs;

    DoublePrecision;
    CrossPlatformDeterministic;
    FloatingPointExceptionsEnabled;
    ProfilerInDebugAndRelease;
    ProfilerInDistribution;
    UseExternalProfile;
    DebugRendererInDebugAndRelease;
    DebugRendererInDistribution;
    DisableCustomAllocator;
    ObjectLayer32Bits;
    UseAsserts;
    EnableObjectStream;

    Default :: BuildTypeDebug | ProfilerInDebugAndRelease | DebugRendererInDebugAndRelease | EnableObjectStream;
}

#run {
    set_build_options_dc(.{do_output=false});

    build_joltc := false;
    disabled_compile_options : JoltCompileOptions;
    compile_options := JoltCompileOptions.Default;

    args := get_build_options().compile_time_command_line;
    for args {
        if it == {
        case "build";
            build_joltc = true;
        case "shared_libs";
            compile_options |= .SharedLibs;
        case "combined_shared_libs";
            compile_options |= .CombinedSharedLibs;
        case "build_debug";
            compile_options &= ~(.BuildTypeRelease | .BuildTypeDistribution);
            compile_options |= .BuildTypeDebug;
        case "build_release";
            compile_options &= ~(.BuildTypeRelease | .BuildTypeDistribution);
            compile_options |= .BuildTypeRelease;
        case "build_distribution";
            compile_options &= ~(.BuildTypeDebug | .BuildTypeRelease);
            compile_options |= .BuildTypeDistribution;
        case "double_precision";
            compile_options |= .DoublePrecision;
        case "cross_platform_deterministic";
            compile_options |= .CrossPlatformDeterministic;
        case "floating_point_exceptions_enabled";
            compile_options |= .FloatingPointExceptionsEnabled;
        case "disable_custom_allocator";
            compile_options |= .DisableCustomAllocator;
        case "profiler_in_distribution";
            compile_options |= .ProfilerInDistribution;
        case "profiler_in_debug_and_release";
            compile_options |= .ProfilerInDebugAndRelease;
        case "no_profiler_in_debug_and_release";
            disabled_compile_options |= .ProfilerInDebugAndRelease;
        case "debug_renderer_in_distribution";
            compile_options |= .DebugRendererInDistribution;
        case "debug_renderer_in_debug_and_release";
            compile_options |= .DebugRendererInDebugAndRelease;
        case "no_debug_renderer_in_debug_and_release";
            disabled_compile_options |= .DebugRendererInDebugAndRelease;
        case "external_profile";
            compile_options |= .UseExternalProfile;
        case "object_layer_32bits";
            compile_options |= .ObjectLayer32Bits;
        case "enable_asserts";
            compile_options |= .UseAsserts;
        case "disable_asserts";
            disabled_compile_options |= .UseAsserts;
        case "object_stream";
            compile_options |= .EnableObjectStream;
        case "no_object_stream";
            disabled_compile_options |= .EnableObjectStream;
        }
    }

    // Not tied to a specific Jolt build logic
    if compile_options & .BuildTypeDebug {
        compile_options |= .UseAsserts;
    }

    // Apply disabled features
    compile_options &= ~disabled_compile_options;

    if build_joltc && !BuildJoltC(compile_options) {
        compiler_set_workspace_status(.FAILED);
        return;
    }

    if !GenerateBindings(compile_options) {
        compiler_set_workspace_status(.FAILED);
        return;
    }
}

GenerateBindings :: (options : JoltCompileOptions) -> bool {
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

        if options & .DoublePrecision {
            array_add(*bindgen, "-D", "JOLTC_DOUBLE_PRECISION");
        }
        if options & .CrossPlatformDeterministic {
            array_add(*bindgen, "-D", "JOLTC_CROSS_PLATFORM_DETERMINISTIC");
        }
        if options & .FloatingPointExceptionsEnabled {
            array_add(*bindgen, "-D", "JOLTC_FLOATING_POINT_EXCEPTIONS_ENABLED");
        }
        if options & .ProfilerInDebugAndRelease && !(options & .BuildTypeDistribution) {
            if options & .UseExternalProfile {
                array_add(*bindgen, "-D", "JOLTC_EXTERNAL_PROFILE");
            } else {
                array_add(*bindgen, "-D", "JOLTC_PROFILE_ENABLED");
            }
        }
        if options & .ProfilerInDistribution && (options & .BuildTypeDistribution) {
            if options & .UseExternalProfile {
                array_add(*bindgen, "-D", "JOLTC_EXTERNAL_PROFILE");
            } else {
                array_add(*bindgen, "-D", "JOLTC_PROFILE_ENABLED");
            }
        }
        if options & .DebugRendererInDebugAndRelease && !(options & .BuildTypeDistribution) {
            array_add(*bindgen, "-D", "JOLTC_DEBUG_RENDERER");
        }
        if options & .DebugRendererInDistribution && (options & .BuildTypeDistribution) {
            array_add(*bindgen, "-D", "JOLTC_DEBUG_RENDERER");
        }
        if options & .DisableCustomAllocator {
            array_add(*bindgen, "-D", "JOLTC_DISABLE_CUSTOM_ALLOCATOR");
        }
        if options & .ObjectLayer32Bits {
            array_add(*bindgen, "-D", "JOLTC_OBJECT_LAYER_BITS=32");
        }
        if options & .UseAsserts {
            array_add(*bindgen, "-D", "JOLTC_ENABLE_ASSERTS");
        }
        if options & .EnableObjectStream {
            array_add(*bindgen, "-D", "JOLTC_OBJECT_STREAM");
        }

        bindgen_status, bindgen_result, bindgen_error := run_command(..bindgen, capture_and_return_output=true);
        if bindgen_status.exit_code != 0 {
            log_error("joltc-bindgen failed:\n%", bindgen_error);
            return false;
        }

        result = bindgen_result;
    }

    result = sprint("COMBINED_SHARED_LIBS :: %1;\n\n%2", (options & .CombinedSharedLibs) != 0, result);
    write_entire_file("jolt.jai", result);

    return true;
}

BuildJoltC :: (options : JoltCompileOptions) -> bool {
    {
        working_dir := get_working_directory();
        defer set_working_directory(working_dir);

        set_working_directory(tprint("%/Source/JoltC", working_dir));

        if run_command("rm", "-rf", ".build").exit_code != 0 {
            return false;
        }

        configure : [..]string;
        array_add(*configure, "cmake", "-B", ".build");
        array_add(*configure, tprint("-DBUILD_SHARED_LIBS=%", ifx options & .SharedLibs then "ON" else "OFF"));
        array_add(*configure, tprint("-DJOLTC_BUILD_COMBINED_SHARED_LIBS=%", ifx options & .CombinedSharedLibs then "ON" else "OFF"));
        if options & .BuildTypeDebug {
            array_add(*configure, "-DCMAKE_BUILD_TYPE=Debug");
        } else if options & .BuildTypeRelease {
            array_add(*configure, "-DCMAKE_BUILD_TYPE=Release");
        } else if options & .BuildTypeDistribution {
            array_add(*configure, "-DCMAKE_BUILD_TYPE=Distribution");
        }

        array_add(*configure, tprint("-DDOUBLE_PRECISION=%", ifx options & .DoublePrecision then "ON" else "OFF"));
        array_add(*configure, tprint("-DCROSS_PLATFORM_DETERMINISTIC=%", ifx options & .CrossPlatformDeterministic then "ON" else "OFF"));
        array_add(*configure, tprint("-DFLOATING_POINT_EXCEPTIONS_ENABLED=%", ifx options & .FloatingPointExceptionsEnabled then "ON" else "OFF"));
        array_add(*configure, tprint("-DPROFILER_IN_DEBUG_AND_RELEASE=%", ifx options & .ProfilerInDebugAndRelease then "ON" else "OFF"));
        array_add(*configure, tprint("-DPROFILER_IN_DISTRIBUTION=%", ifx options & .ProfilerInDistribution then "ON" else "OFF"));
        array_add(*configure, tprint("-DJPH_USE_EXTERNAL_PROFILE=%", ifx options & .UseExternalProfile then "ON" else "OFF"));
        array_add(*configure, tprint("-DDEBUG_RENDERER_IN_DEBUG_AND_RELEASE=%", ifx options & .DebugRendererInDebugAndRelease then "ON" else "OFF"));
        array_add(*configure, tprint("-DDEBUG_RENDERER_IN_DISTRIBUTION=%", ifx options & .DebugRendererInDistribution then "ON" else "OFF"));
        array_add(*configure, tprint("-DDISABLE_CUSTOM_ALLOCATOR=%", ifx options & .DisableCustomAllocator then "ON" else "OFF"));
        array_add(*configure, tprint("-DOBJECT_LAYER_BITS=%", ifx options & .ObjectLayer32Bits then "32" else "OFF"));
        array_add(*configure, tprint("-DUSE_ASSERTS=%", ifx options & .UseAsserts then "ON" else "OFF"));
        array_add(*configure, tprint("-DENABLE_OBJECT_STREAM=%", ifx options & .EnableObjectStream then "ON" else "OFF"));

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

        if !(options & .CombinedSharedLibs) {
            if !copy_file("Source/JoltC/.build/_deps/joltphysics-build/Debug/Jolt.lib", "Libs/Windows/Jolt.lib") {
                return false;
            }
            if !copy_file("Source/JoltC/.build/_deps/joltphysics-build/Debug/Jolt.pdb", "Libs/Windows/Jolt.pdb") {
                return false;
            }
            if (options & .SharedLibs) && !copy_file("Source/JoltC/.build/_deps/joltphysics-build/Debug/Jolt.dll", "Libs/Windows/Jolt.dll") {
                return false;
            }
        }

        if !copy_file("Source/JoltC/.build/Debug/JoltC.lib", "Libs/Windows/JoltC.lib") {
            return false;
        }
        if !copy_file("Source/JoltC/.build/Debug/JoltC.pdb", "Libs/Windows/JoltC.pdb") {
            return false;
        }
        if ((options & .SharedLibs) || (options & .CombinedSharedLibs)) && !copy_file("Source/JoltC/.build/Debug/JoltC.dll", "Libs/Windows/JoltC.dll") {
            return false;
        }
    } else #if OS == .LINUX {
        // Purge the lib directory because files with different configuration conflict each other
        if run_command("rm", "-rf", "Libs/Linux").exit_code != 0 {
            return false;
        }

        make_directory_if_it_does_not_exist("Libs/Linux", recursive=true);

        if !(options & .SharedLibs) && !(options & .CombinedSharedLibs) {
            if !copy_file("Source/JoltC/.build/_deps/joltphysics-build/libJolt.a", "Libs/Linux/libJolt.a") {
                return false;
            }
            if !copy_file("Source/JoltC/.build/libJoltC.a", "Libs/Linux/libJoltC.a") {
                return false;
            }
        } else {
            if !(options & .CombinedSharedLibs) {
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
