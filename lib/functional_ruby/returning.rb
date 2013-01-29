module Returning
  def returning object, &block
    yield
    object
  end
end