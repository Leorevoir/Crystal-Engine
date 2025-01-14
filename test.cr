require "lib_glfw"

## first attempt for a basic open window buffer with pure opengl
## libglfw binds glfw c function into crystal lang
LibGLFW.init

LibGLFW.window_hint(LibGLFW::CONTEXT_VERSION_MAJOR, 3)
LibGLFW.window_hint(LibGLFW::CONTEXT_VERSION_MINOR, 3)
LibGLFW.window_hint(LibGLFW::OPENGL_PROFILE, LibGLFW::OPENGL_CORE_PROFILE)

w = LibGLFW.create_window(800, 600, "salut", nil, nil)
LibGLFW.make_context_current(w)

while LibGLFW.window_should_close(w)
    LibGLFW.swap_buffers(w)
end

LibGLFW.destroy_window(w)
LibGLFW.terminate
