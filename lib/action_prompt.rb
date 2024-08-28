require "action_prompt/version"
require "action_prompt/engine"

module ActionPrompt
  def self.render(template_name, locals: {})
    controller = ApplicationController.new
    controller.prepend_view_path(Rails.root.join("app", "prompts"))
    controller.render_to_string(template: template_name, locals: locals)
  end
end
