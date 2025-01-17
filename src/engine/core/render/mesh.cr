module RenderLoop

    class Mesh

        property vbo : LibGL::UInt
        property size : Int32 = 0

        def initialize
            LibGL.gen_buffers(1, out @vbo)
            Log.info "VBO: #{@vbo}"
        end

        def add_vertices(vertices : Array(Vertex))
            @size = vertices.size
            Log.info "adding #{size} vertices"

            # buffer = Util.flatten_vertices(vertices)
            buffer = Util.create_flipped_buffer(vertices)
            Log.info "buffer data: #{buffer.inspect}"

            LibGL.bind_buffer(LibGL::ARRAY_BUFFER, @vbo)
            error = LibGL.get_error
            Log.warn "after bind in add_vertices #{error}"

            LibGL.buffer_data(LibGL::ARRAY_BUFFER, vertices.size * Vertex::SIZE * sizeof(Float32), buffer, LibGL::STATIC_DRAW)
        end

        def dra_w
            # Log.info "drawing with size: #{@size}"

            LibGL.enable_vertex_attrib_array 0
            # error = LibGL.get_error
            # Log.warn "after enable attrib array: #{error}"

            LibGL.bind_buffer(LibGL::ARRAY_BUFFER, @vbo)
            LibGL.vertex_attrib_pointer(
                0_u32,               # index
                3,                   # size
                LibGL::FLOAT,        # data_type
                LibGL::FALSE,        # normalized
                Vertex::SIZE * 4,    # stride
                Pointer(Void).null)  # pointer offset
            LibGL.draw_arrays(LibGL::TRIANGLES, 0, @size)

            # error = LibGL.get_error
            # puts "after vertex attrib pointer: #{error}"

            LibGL.disable_vertex_attrib_array 0
        end
        def draw
  LibGL.enable_vertex_attrib_array 0
  LibGL.bind_buffer(LibGL::ARRAY_BUFFER, @vbo)
  LibGL.vertex_attrib_pointer(
    0_u32,               # index
    3,                   # size
    LibGL::FLOAT,        # data_type
    LibGL::FALSE,        # normalized
    Vertex::SIZE * 4,    # stride
    Pointer(Void).null)  # pointer offset
  LibGL.draw_arrays(LibGL::TRIANGLES, 0, @size)
  LibGL.disable_vertex_attrib_array 0
end


    end

end
