require "test_helper"

class ActionPrompt::PreviewTest < ActiveSupport::TestCase
  test "all" do
    previews =  ActionPrompt::Preview.all
    assert_equal 1, previews.count
  end

  test "preview_name" do
    preview = ActionPrompt::Preview.all.first

    assert_equal "hello_world", preview.preview_name
  end

  test "render without locals" do
    result = HelloWorldPreview.new.hello_world
    assert_equal "You are a helpful assistant who replies with, \"Hello, world!\"", result
  end

  test "render with locals" do
    result = HelloWorldPreview.new.hello_somebody
    assert_equal "You are a helpful assistant who replies with, \"Hello, Lenny!\"", result
  end
end
