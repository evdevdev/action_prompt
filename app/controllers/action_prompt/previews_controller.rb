class ActionPrompt::PreviewsController < ActionController::Base
  prepend_view_path ActionPrompt::Engine.root.join("app", "views")
  layout "application"
  # Ideally, we'd like to inhert from Rails::ApplicationController, but that
  # would prevent us from using a Tailwind CDN. So instead, we're using ActionController::Base.
  #
  # If we are able to use Rails::ApplicationController, then re-enable this line
  # before_action :require_local!

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
