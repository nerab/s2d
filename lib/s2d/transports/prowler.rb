module S2D
  module Transports
    class Prowler < Transport
      include S2D::Configuration

      def initialize(config)
        super(config)
        ::Prowler.logger.level = Logger::WARN
        @prowler = ::Prowler.new(:application => $0, :api_key => config[:api_key])
      end

      def deliver(message)
        @prowler.notify(message.subject, message.body)
      end

      #
      # Config wizard uses this information to collect required and optional
      # config parameters
      #
      def attributes
        [ MandatoryAttribute.new(:api_key, 'API key for prowlapp.com'),
          OptionalAttribute.new(:application, 'Application name to be passed to Prowl', $0),
        ]
      end
    end
  end
end
