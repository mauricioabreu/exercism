module HelloWorld
  extend self

  def hello
    "Hello, World"
  end

  def hello(name : String)
    "Hello, #{name}"
  end
end
