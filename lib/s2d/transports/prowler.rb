module S2D
  module Transports
    class Prowler
      def initialize(api_key)
        @prowler = ::Prowler.new(:application => $0, :api_key => api_key)
      end

      def deliver(message)
        @prowler.notify(message.subject, message.body)
      end
    end
  end
end
