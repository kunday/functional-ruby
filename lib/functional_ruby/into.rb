module Into
  def into &block
    block.call(self)
  end
end