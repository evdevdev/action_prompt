class ActionPrompt::PreviewsController < Rails::ApplicationController
  prepend_view_path ActionPrompt::Engine.root.join("app", "views")
  before_action :require_local!

  def index
    @page_title = "Action Prompt Previews"
    @previews = []
  end

  def show
  end
end
