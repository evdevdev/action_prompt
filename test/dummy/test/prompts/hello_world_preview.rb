class HelloWorldPreview < ActionPrompt::Preview
  def hello_world
    ActivePrompt.render("hello_world")
  end

  def hello_somebody
    ActivePrompt.render("hello_somebody", locals: { name: "Lenny" })
  end
end
