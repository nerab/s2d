module S2D
  module Transports
    class Transport
      attr_reader :config

      def initialize(config)
        @config = config
      end

      def deliver(message)
        raise "Transport class #{self.class} does not implement #deliver(message)"
      end

      #
      # Config wizard uses this information to collect required and optional
      # config parameters
      #
      def attributes
        []
      end

      def to_s
        self.class.name.demodulize
      end
    end
  end
end
