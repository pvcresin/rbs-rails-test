class Article < ApplicationRecord
  attr_reader :name #: String
  attr_reader :size, :count #: Integer

  # @rbs () -> String
  def hello
    "Hello, world!"
  end

  # @rbs (id: Integer, email: String) -> String
  def a(id:, email:)
    id.to_s + email
  end

  # @rbs (?Regexp?) -> Enumerator[String, void]
  #    | (?Regexp?) { (String) -> void } -> void
  def each_person(pattern = nil, &block)
  end

  def foo #: Array[String]
    arr = [ 1, 2, 3 ]
    arr.map { |x| x.to_s }
  end

  # @rbs () -> Array[String]
  def bar
    [ 1, 2, 3 ].map { |x| x.to_s }
  end

  # @rbs (other: Article) -> bool
  def ==(other:)
    self.id == other.id
  end
end
