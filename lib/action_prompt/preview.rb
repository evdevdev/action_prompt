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

      def preview_name
        name.delete_suffix("Preview").underscore
      end

      def prompts
        public_instance_methods(false).map(&:to_s).sort
      end
    end
  end
end
