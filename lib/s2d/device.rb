module S2D
  class Device
    extend Forwardable
    def_delegator :transport, :deliver

    attr_reader :name
    attr_accessor :transport

    def initialize(name)
      @name = name
    end
  end
end
