class Window

    getter window : Pointer(LibGLFW::Window)

    def initialize(width : U32, height : U32, title : String)
        # classic OpenGL hint
        LibGLFW.window_hint(LibGLFW::CONTEXT_VERSION_MAJOR, 3)
        LibGLFW.window_hint(LibGLFW::CONTEXT_VERSION_MINOR, 3)
        LibGLFW.window_hint(LibGLFW::OPENGL_PROFILE, LibGLFW::OPENGL_CORE_PROFILE)

        @window = LibGLFW.create_window(width, height, title, nil, nil)
        LibGLFW.make_context_current(@window)
        # disable vsync
        LibGLFW.swap_interval(0)
    end

    ####################################################################
    # render window
    def render
        LibGLFW.swap_buffers(@window)
    end

    ####################################################################
    # core event informations that needs a @window instance
    def should_close? : Bool
        LibGLFW.window_should_close(@window) == 1
    end

    def key_pressed?(key : Event::Key) : Bool
        LibGLFW.get_key(@window, key) == LibGLFW::PRESS
    end

    def mouse_pressed?(button : Event::MouseButton) : Bool
        LibGLFW.get_mouse_button(@window, button) == LibGLFW::PRESS
    end

    #TODO: mouse released & key released methods with glfw

    ####################################################################
    # free-related methods
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
