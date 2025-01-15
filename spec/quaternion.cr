describe Quaternion do
    it "calculates the correct length" do
        q = Quaternion.new(1.0, 2.0, 3.0, 4.0)
        q.length.should be_close(5.4772, 0.0001)
    end

    it "calculates normalize" do
        q = Quaternion.new(0.0, 3.0, 4.0, 5.0)
        q.normalize
        q.x.should eq(0.0)
        q.y.should be_close(0.4242, 0.0001)
        q.z.should be_close(0.5656, 0.0001)
        q.w.should be_close(0.7071, 0.0001)
    end

    it "calculates conjugate" do
        q = Quaternion.new(0.0, 3.0, 4.0, 5.0)
        q_ = q.conjugate
        q_.x.should eq(-0.0)
        q_.y.should eq(-3.0)
        q_.z.should eq(-4.0)
        q_.w.should eq(5.0)
    end

    it "multiplies two quaternion" do
        q = Quaternion.new(0.0, 3.0, 4.0, 5.0)
        q_ = Quaternion.new(0.0, 1.0, 2.0, 3.0)

        result = q * q_
        result.x.should eq(4.0)
        result.y.should eq(2.0)
        result.z.should eq(14.0)
        result.w.should eq(22.0)
    end

end
