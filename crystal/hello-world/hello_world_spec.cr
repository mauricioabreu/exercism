require "spec"
require "./hello_world"

describe "HelloWorld" do
  describe "#hello" do
    it "says hello with default 'World'" do
      HelloWorld.hello.should eq "Hello, World"
    end

    it "says hello with one name" do
      HelloWorld.hello("Max").should eq "Hello, Max"
    end

    it "says hello with another name" do
      HelloWorld.hello("Alice").should eq "Hello, Alice"
    end
  end
end
