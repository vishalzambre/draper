module Draper
  # Provides the {#helpers} method used in {Decorator} and {CollectionDecorator}
  # to call the Rails helpers.
  module ViewHelpers
    extend ActiveSupport::Concern

    module ClassMethods
      # Access the helpers proxy to call built-in and user-defined
      # Rails helpers from a class context.
      #
      # @return [HelperProxy] the helpers proxy
      def helpers
        Draper::ViewContext.current
      end

      alias :h :helpers
    end

    # Access the helpers proxy to call built-in and user-defined
    # Rails helpers. Aliased to `h` for convenience.
    #
    # @return [HelperProxy] the helpers proxy
    def helpers
      Draper::ViewContext.current
    end

    alias :h :helpers

    # Alias for `helpers.localize`, since localize is something that's used
    # quite often. Further aliased to `l` for convenience.
    ruby2_keywords def localize(object, **options)
      helpers.localize(object, **options)
    end

    alias :l :localize
  end
end
