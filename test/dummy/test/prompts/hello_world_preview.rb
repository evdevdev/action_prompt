class HelloWorldPreview < ActionPrompt::Preview
  def hello_world
    render("hello_world")
  end

  def hello_somebody
    render("hello_somebody", locals: { name: "Lenny" })
  end
end
