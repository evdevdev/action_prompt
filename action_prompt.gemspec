require_relative "lib/action_prompt/version"

Gem::Specification.new do |spec|
  spec.name        = "action_prompt"
  spec.version     = ActionPrompt::VERSION
  spec.authors     = [ "Evan Arnold" ]
  spec.email       = [ "evan.arnold@gmail.com" ]
  spec.homepage    = "https://github.com/evdevdev/action_prompt"
  spec.summary     = "ActionPrompt is a Rails plugin for managing templated LLM prompts"
  spec.description = "ActionPrompt is a Rails plugin for managing templated LLM prompts"
  spec.license     = "MIT"

  spec.metadata["homepage_uri"] = spec.homepage

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  end

  spec.add_dependency "rails", ">= 7.2.1"
end
