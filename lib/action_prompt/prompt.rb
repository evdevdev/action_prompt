module ActionPrompt
  class Prompt
    attr_reader :name, :slug

    # NOTE: this could probably be a Struct
    def initialize(name:, slug:)
      @name = name
      @slug = slug
    end
  end
end
