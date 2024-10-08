require "active_support/descendants_tracker"

module ActionPrompt
  class Preview
    # We need to be able to do the following:
    # - find all the preview objects
    # - find all the preview methods on those objects
    # - render a preview
    #
    class << self
      def all
        load_previews if descendants.empty?
        descendants.sort_by(&:name)
      end

      def load_previews
        # TODO: this preview path could be made configurable in order to have equivalent
        # functionality to Rails mailer previews
        Dir[Rails.root.join("test", "prompts", "**", "*_preview.rb")].each do |path|
          require path
        end
      end

      def display_name
        name.titleize
      end

      def slug
        name.delete_suffix("Preview").underscore
      end

      def prompts
        # TODO: this might benefit from some memoization
        prompt_methods = public_instance_methods(false).map(&:to_s).sort

        prompt_methods.map do |method_name|
          Prompt.new(name: method_name.humanize,
                     slug: "#{slug}/#{method_name}")
        end
      end

      def find(name)
        all.find { |preview| preview.name == name }
      end

      def find_prompt(slug)
        prompts.find { |p| p.slug == slug }
      end
    end

    def render(template_name, locals: {})
      ActionPrompt::Renderer.new.render(template_name, locals: locals)
    end
  end
end
