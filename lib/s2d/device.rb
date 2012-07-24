module S2D
  class Device
    extend Forwardable
    def_delegator :transport, :deliver

    class << self
      def lookup(alyas)
        devices = {}

          # replace with lookup from user config directory
          iPhone = Device.new('iPhone Nico')
          iPhone.transport = ProwlerTransport.new('fa87a45523a8e75e572654d04f5249e1c1b694ef')
          devices['2iphone'] = iPhone

        # regular lookup
        devices[alyas]
      end
    end

    attr_reader :name
    attr_accessor :transport

    def initialize(name)
      @name = name
    end
  end
end
