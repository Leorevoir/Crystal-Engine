####################################################################
# Vector2f
describe Vector2f do
    it "calculates the correct length" do
        v = Vector2f.new(3.0, 4.0)
        v.length.should eq(5.0)
    end

    it "computes the dot product" do
        v1 = Vector2f.new(1.0, 2.0)
        v2 = Vector2f.new(3.0, 4.0)
        v1.dot(v2).should eq(11.0)
    end

    it "normalizes the vector" do
        v = Vector2f.new(3.0, 4.0)
        v.normalize
        v.x.should be_close(0.6, 0.0001)
        v.y.should be_close(0.8, 0.0001)
    end

    it "rotates the vector correctly" do
        v = Vector2f.new(1.0, 0.0)
        result = v.rotate(90.0)
        result.x.should be_close(0.0, 0.0001)
        result.y.should be_close(1.0, 0.0001)
    end

    it "adds two vectors" do
        v1 = Vector2f.new(1.0, 2.0)
        v2 = Vector2f.new(3.0, 4.0)
        result = v1 + v2
        result.x.should eq(4.0)
        result.y.should eq(6.0)
    end

    it "adds a scalar to the vector" do
        v = Vector2f.new(1.0, 2.0)
        result = v + 3.0
        result.x.should eq(4.0)
        result.y.should eq(5.0)
    end

    it "subtracts two vectors" do
        v1 = Vector2f.new(5.0, 6.0)
        v2 = Vector2f.new(3.0, 4.0)
        result = v1 - v2
        result.x.should eq(2.0)
        result.y.should eq(2.0)
    end

    it "subtracts a scalar from the vector" do
        v = Vector2f.new(5.0, 6.0)
        result = v - 2.0
        result.x.should eq(3.0)
        result.y.should eq(4.0)
    end

    it "multiplies two vectors element-wise" do
        v1 = Vector2f.new(2.0, 3.0)
        v2 = Vector2f.new(4.0, 5.0)
        result = v1 * v2
        result.x.should eq(8.0)
        result.y.should eq(15.0)
    end

    it "multiplies a vector by a scalar" do
        v = Vector2f.new(2.0, 3.0)
        result = v * 3.0
        result.x.should eq(6.0)
        result.y.should eq(9.0)
    end
end


####################################################################
# Vector3f
# INFO: not test yet for rotate method
describe Vector3f do
    it "calculates the correct length" do
        v = Vector3f.new(1.0, 2.0, 2.0)
        v.length.should eq(3.0)
    end

    it "computes the dot product" do
        v1 = Vector3f.new(1.0, 2.0, 3.0)
        v2 = Vector3f.new(4.0, 5.0, 6.0)
        v1.dot(v2).should eq(32.0)
    end

    it "normalizes the vector" do
        v = Vector3f.new(0.0, 3.0, 4.0)
        v.normalize
        v.x.should eq(0.0)
        v.y.should be_close(0.6, 0.0001)
        v.z.should be_close(0.8, 0.0001)
    end

    it "adds two vectors" do
        v1 = Vector3f.new(1.0, 2.0, 3.0)
        v2 = Vector3f.new(4.0, 5.0, 6.0)
        result = v1 + v2
        result.x.should eq(5.0)
        result.y.should eq(7.0)
        result.z.should eq(9.0)
    end

    it "adds a scalar to the vector" do
        v = Vector3f.new(1.0, 2.0, 3.0)
        result = v + 3.0
        result.x.should eq(4.0)
        result.y.should eq(5.0)
        result.z.should eq(6.0)
    end

    it "subtracts two vectors" do
        v1 = Vector3f.new(5.0, 6.0, 7.0)
        v2 = Vector3f.new(3.0, 4.0, 5.0)
        result = v1 - v2
        result.x.should eq(2.0)
        result.y.should eq(2.0)
        result.z.should eq(2.0)
    end

    it "subtracts a scalar from the vector" do
        v = Vector3f.new(5.0, 6.0, 7.0)
        result = v - 2.0
        result.x.should eq(3.0)
        result.y.should eq(4.0)
        result.z.should eq(5.0)
    end

    it "multiplies two vectors element-wise" do
        v1 = Vector3f.new(2.0, 3.0, 4.0)
        v2 = Vector3f.new(4.0, 5.0, 6.0)
        result = v1 * v2
        result.x.should eq(8.0)
        result.y.should eq(15.0)
        result.z.should eq(24.0)
    end

    it "multiplies a vector by a scalar" do
        v = Vector3f.new(2.0, 3.0, 4.0)
        result = v * 3.0
        result.x.should eq(6.0)
        result.y.should eq(9.0)
        result.z.should eq(12.0)
    end
end

