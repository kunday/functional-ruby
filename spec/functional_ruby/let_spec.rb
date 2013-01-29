require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Let do
  include Let
  it "should not clobber existing scope variable" do
    #ruby 1.9 behaviour does this by default
    before_value = true
    let value = false do |before_value|
      before_value = false
    end
    before_value.should == true
  end
  it "should be undefined afte the scope" do
    let value = false do |before_value|
      before_value = true
    end
    -> akr{before_value}.should raise_error
  end
end