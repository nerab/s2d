module S2D
  module Mappers
    class DeviceMapper
      class << self
        def to_hash(device)
          {}.tap do |h|
            h[:name] = device.name
            h[:transport] = TransportMapper.to_hash(device.transport)
          end
        end

        def to_object(h)
          Device.new(h[:name]).tap do |d|
            d.transport = TransportMapper.to_object(h[:transport])
          end
        end
      end
    end
  end
end
