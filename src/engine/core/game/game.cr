class Game

    alias Mesh = RenderLoop::Mesh

    def initialize
        @mesh = Mesh.new

        data = [
            Vertex.new(Vector3f.new(-1, -1, 0)),
            Vertex.new(Vector3f.new(0, 1, 0)),
            Vertex.new(Vector3f.new(1, -1, 0))]

        @mesh.add_vertices(data)
    end

    def register_input(@input : Event::Input)
    end

    def input
        input = @input
        return unless input

        if input.get_key_down(Event::Input::W)
            Log.info "pressed up!"
        end
        #TODO: fix released
        if input.get_key_up(Event::Input::W)
            Log.info "released up!"
        end
    end

    def update
    end

    def render
        @mesh.draw
    end

end
