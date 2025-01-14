class Window

    getter window : Pointer(LibGLFW::Window)

    def initialize(width : U32, height : U32, title : String)
        # classic OpenGL hint
        LibGLFW.window_hint(LibGLFW::CONTEXT_VERSION_MAJOR, 3)
        LibGLFW.window_hint(LibGLFW::CONTEXT_VERSION_MINOR, 3)
        LibGLFW.window_hint(LibGLFW::OPENGL_PROFILE, LibGLFW::OPENGL_CORE_PROFILE)

        @window = LibGLFW.create_window(width, height, title, nil, nil)
        LibGLFW.make_context_current(@window)
        LibGLFW.swap_interval(0)
    end

    def render
        LibGLFW.swap_buffers(@window)
    end

    def should_close? : Bool
        LibGLFW.window_should_close(@window) == 1
    end

    def destroy
        puts "INFO: Window détruite explicitement"
        LibGLFW.destroy_window(@window)
    end

    # should be called by GC
    def finalize
        puts "INFO: Window collectée par le GC"
        destroy
    end

end
