class ActionPrompt::PreviewsController < Rails::ApplicationController
  prepend_view_path ActionPrompt::Engine.root.join("app", "views")
  before_action :require_local!

  def index
    @page_title = "Action Prompt Previews"
    @previews = ActionPrompt::Preview.all
  end

  def show
    preview_class_name = params[:preview_name].camelize + "Preview"
    @preview_class = ActionPrompt::Preview.find(preview_class_name)
    @prompt_output = @preview_class.new.send(params[:prompt_name].to_sym)
  end
end
