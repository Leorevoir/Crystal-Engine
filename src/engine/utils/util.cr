module Util

    #TODO: flip vertices in a better way

    alias FloatBuffer = Slice(Float64)

    def self.create_float_buffer(size : Int32) : FloatBuffer
        FloatBuffer.new(size)
    end

    def self.create_flipped_buffer(vertices : Array(Vertex)) : FloatBuffer
        buffer = create_float_buffer(vertices.size * Vertex::SIZE)

        vertices.each_with_index do |vertex, i|
            index = i * Vertex::SIZE
            buffer[index] = vertex.pos.x
            buffer[index + 1] = vertex.pos.y
            buffer[index + 2] = vertex.pos.z
        end

        buffer
    end

end
