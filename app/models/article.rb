class Article < ApplicationRecord
  # @rbs () -> String
  def hello
    "Hello, world!"
  end

  # @rbs (Integer) -> Integer
  def a(param)
    rand(param)
  end
end
