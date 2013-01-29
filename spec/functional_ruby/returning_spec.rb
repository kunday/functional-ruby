require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Returning do
  include Returning
  it "should not mutate the object" do
    hash = {}
    lambda { returning hash = Hash.new do |h|
      h["a"] = "b"
    end }.should raise_error
    hash["a"].should_not be
  end
  it "should eval the block provided" do
    block_called = false
    probe = lambda {block_called = true}
    returning (hash = Hash.new) do
      probe.call
    end
    block_called.should be
  end
end