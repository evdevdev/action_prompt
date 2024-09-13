module ActionPrompt
  class Renderer
    def initialize
      # NOOP
    end

    def render(template_name, locals: {})
      controller = ApplicationController.new
      controller.prepend_view_path(Rails.root.join("app", "prompts"))
      controller.render_to_string(template: template_name, locals: locals, layout: false)
    end
  end
end
