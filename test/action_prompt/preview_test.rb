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
end
