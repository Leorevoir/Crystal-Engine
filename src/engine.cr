require "lib_glfw"
require "lib_gl"
require "./engine/type.cr"
require "./engine/utils/**"
require "./engine/core/**"

module Engine
    extend self

    VERSION = "0.1.0"

    ####################################################################
    # entry point
    def run(width : U32 = 1280, height : U32 = 720, title : String = "3D Engine", fps : Float32 = 60_f32)
        # init OpenGL
        if LibGLFW.init == 0
            puts "ERROR: failed to load LibGLFW"
            return
        end

        #create window
        window = Window.new(
            width: width,
            height: height,
            title: title
        )
        game = Game.new
        render = RenderLoop::Render.new(game, window, fps)
        render.start
        # end OpenGL
        LibGLFW.terminate
    end

end

Engine.run(fps: 120)
