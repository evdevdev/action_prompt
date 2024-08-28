require "test_helper"

class ActionPrompt::PreviewControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get "/action_prompt/previews"
    assert_response :success
  end
end
