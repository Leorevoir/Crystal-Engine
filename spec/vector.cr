describe Vector2f do
    it "calculates the correct length" do
        v = Vector2f.new(3.0, 4.0)
        v.length.should eq(5.0)
    end

    it "normalizes the vector" do
        v = Vector2f.new(3.0, 4.0)
        v.normalize
        v.x.should be_close(0.6, 0.0001)
        v.y.should be_close(0.8, 0.0001)
    end

    it "computes the dot product" do
        v1 = Vector2f.new(1.0, 2.0)
        v2 = Vector2f.new(3.0, 4.0)
        v1.dot(v2).should eq(11.0)
    end

    it "adds two vectors" do
        v1 = Vector2f.new(1.0, 2.0)
        v2 = Vector2f.new(3.0, 4.0)
        result = v1 + v2
        result.x.should eq(4.0)
        result.y.should eq(6.0)
    end
end

describe Vector3f do
    it "calculates the correct length" do
        v = Vector3f.new(1.0, 2.0, 2.0)
        v.length.should eq(3.0)
    end

    it "normalizes the vector" do
        v = Vector3f.new(0.0, 3.0, 4.0)
        v.normalize
        v.x.should eq(0.0)
        v.y.should be_close(0.6, 0.0001)
        v.z.should be_close(0.8, 0.0001)
    end

    it "computes the dot product" do
        v1 = Vector3f.new(1.0, 2.0, 3.0)
        v2 = Vector3f.new(4.0, 5.0, 6.0)
        v1.dot(v2).should eq(32.0)
    end

    it "adds two vectors" do
        v1 = Vector3f.new(1.0, 2.0, 3.0)
        v2 = Vector3f.new(4.0, 5.0, 6.0)
        result = v1 + v2
        result.x.should eq(5.0)
        result.y.should eq(7.0)
        result.z.should eq(9.0)
    end
end

