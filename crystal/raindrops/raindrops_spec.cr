require "spec"
require "./raindrops"

describe "Raindrops" do
  describe "#drops" do
    it "converts 1 to 1" do
      Raindrops.drops(1).should eq "1"
    end

    it "converts 3 to Pling" do
      Raindrops.drops(3).should eq "Pling"
    end

    it "converts 5 to Plang" do
      Raindrops.drops(5).should eq "Plang"
    end

    it "converts 7 to Plong" do
      Raindrops.drops(7).should eq "Plong"
    end

    it "converts 35 to PlangPlong" do
      Raindrops.drops(35).should eq "PlangPlong"
    end

    it "converts 52 to 52" do
      Raindrops.drops(52).should eq "52"
    end

    it "converts 105 to PlingPlangPlong" do
      Raindrops.drops(105).should eq "PlingPlangPlong"
    end
  end
end
