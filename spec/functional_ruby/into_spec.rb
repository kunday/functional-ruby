require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Into do
  class Object
    include Into
  end
  it "should eval the expression" do
    ((1..5).inject(&:+).into {|x| x}).should == 15
  end
  it "should eval the expression and call the block" do
    block_called = false
    probe = lambda {block_called = true}
    ((1..5).inject(&:+).into {probe.call})
    block_called.should be
  end
end