require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Inside do
  include Inside
  it "should update the parent object when using inside" do
    inside hash = Hash.new do |h|
      h["a"] = "b"
    end
    hash["a"].should == "b"
  end
  it "should eval the code provided" do
    block_called = false
    probe = lambda {block_called = true}
    inside (hash = Hash.new) do 
      probe.call
    end
    block_called.should be
  end
end