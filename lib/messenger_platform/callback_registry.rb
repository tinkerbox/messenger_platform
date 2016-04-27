require 'json'

module MessengerPlatform
  class CallbackRegistry

    module ClassMethods

      attr_reader :callbacks

      def register(klass)
        @callbacks[klass.new.callback_name] = klass.to_s
      end

      def get_callback_handler_for(webhook_name)
        @callbacks[webhook_name]&.constantize
      end

    end

    extend ClassMethods

  end

  CallbackRegistry.class_eval do
    @callbacks = {}
  end

end
