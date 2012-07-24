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

        def to_object(h)
          h[:name].new(h[:config])
        end
      end
    end
  end
end
