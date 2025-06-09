module ActionPrompt
  class Renderer
    def initialize
      @controller = ApplicationController.new
      @controller.prepend_view_path(Rails.root.join("app", "prompts"))
    end

    def render(template_name, locals: {})
      @controller.render_to_string(template: template_name, locals: locals, layout: false)
    end
  end
end
