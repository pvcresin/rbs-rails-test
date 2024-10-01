class Article < ApplicationRecord
  # @rbs () -> String
  def hello
    "Hello, world!"
  end

  # @rbs () -> Integer
  def a
    rand(10)
  end
end
