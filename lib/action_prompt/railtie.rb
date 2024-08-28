require "rails/application_controller"

module ActionPrompt
  class Railtie < Rails::Railtie
    config.after_initialize do |app|
      if Rails.env.development? || Rails.env.test?
        app.routes.prepend do
          get "/action_prompt/previews", to: "action_prompt/previews#index" # , internal: true
          get "/action_prompt/preview/:prompt", to: "action_prompt/previews#show" # , internal: true
        end
      end
    end
  end
end
