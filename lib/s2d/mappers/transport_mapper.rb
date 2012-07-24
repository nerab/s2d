module S2D
  module Mappers
    class TransportMapper
      class << self
        def to_hash(transport)
          {}.tap do |h|
            h[:name]   = transport.class
            h[:config] = transport.config
          end
        end
      end
    end
  end
end
