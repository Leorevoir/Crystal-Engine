describe Matrix4f do
    it "initializes to a zero matrix" do
        matrix = Matrix4f.new
        (0..3).each do |i|
            (0..3).each do |j|
                matrix.get(i, j).should eq(0.0)
            end
        end
    end

    it "creates an identity matrix" do
        matrix = Matrix4f.new.init_identity
        expected_values = [
            [1.0, 0.0, 0.0, 0.0],
            [0.0, 1.0, 0.0, 0.0],
            [0.0, 0.0, 1.0, 0.0],
            [0.0, 0.0, 0.0, 1.0],
        ]

        (0..3).each do |i|
            (0..3).each do |j|
                matrix.get(i, j).should eq(expected_values[i][j])
            end
        end
    end

    it "sets and gets individual matrix elements" do
        matrix = Matrix4f.new
        matrix.set(1, 2, 3.14)
        matrix.get(1, 2).should eq(3.14)
    end

    it "multiplies two matrices correctly" do
        matrix_a = Matrix4f.new.init_identity
        matrix_b = Matrix4f.new.init_identity
        matrix_b.set(0, 1, 2.0)
        matrix_b.set(1, 2, 3.0)

        result = matrix_a * matrix_b

        expected_values = [
            [1.0, 2.0, 0.0, 0.0],
            [0.0, 1.0, 3.0, 0.0],
            [0.0, 0.0, 1.0, 0.0],
            [0.0, 0.0, 0.0, 1.0],
        ]

        (0..3).each do |i|
            (0..3).each do |j|
                result.get(i, j).should eq(expected_values[i][j])
            end
        end
    end

    it "checks matrix equality" do
        matrix_a = Matrix4f.new.init_identity
        matrix_b = Matrix4f.new.init_identity

        matrix_a.should eq(matrix_b)

        matrix_b.set(0, 1, 2.0)
        matrix_a.should_not eq(matrix_b)
    end

end
