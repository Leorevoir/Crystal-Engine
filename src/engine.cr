require "lib_glfw"
require "./engine/**"

module Engine
    extend self

    VERSION = "0.1.0"

    ####################################################################
    # entry point
    def run(width : U32 = 1280, height : U32 = 720, title : String = "3D Engine", fps : Float64 = 60f64)
        # init OpenGL
        LibGLFW.init
        # WARNING: NOQA
        #create window
        game = Game.new
        render = RenderLoop::Render.new(game, fps)
        window = Window.new(
            width: width,
            height: height,
            title: title
        )
        render.start window
        # end OpenGL
        LibGLFW.terminate
    end

end

