require "test_helper"

class ActionPrompt::BaseTest < ActiveSupport::TestCase
  test "hello world" do
    result = ActionPrompt.render("hello_world")
    assert_equal "You are a helpful assistant who replies with, \"Hello, world!\"", result
  end

  test "a template with a variable" do
    result = ActionPrompt.render("hello_somebody", locals: { name: "John" })
    assert_equal "You are a helpful assistant who replies with, \"Hello, John!\"", result
  end
end
