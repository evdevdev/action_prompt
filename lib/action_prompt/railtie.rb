require "rails/application_controller"

module ActionPrompt
  class Railtie < Rails::Railtie
    config.before_configuration do |app|
      app.config.autoload_paths << Rails.root.join("tests/prompts")
    end

    config.after_initialize do |app|
      if Rails.env.development? || Rails.env.test?
        app.routes.prepend do
          get "/action_prompt/previews", to: "action_prompt/previews#index" # , internal: true
          get "/action_prompt/previews/:preview_name/:prompt_name", to: "action_prompt/previews#show" # , internal: true
        end
      end
    end
  end
end
