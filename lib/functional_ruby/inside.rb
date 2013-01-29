module Inside
  def inside object, &block
    object.instance_eval(&block)
    object
  end
end