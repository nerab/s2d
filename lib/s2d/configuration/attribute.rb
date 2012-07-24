module S2D
  module Configuration
    class Attribute
      attr_reader :key, :description

      protected

      def initialize(mandatory, key, description)
        @mandatory, @key, @description = mandatory, key, description
      end

      def mandatory?
        @mandatory
      end
    end

    class MandatoryAttribute < Attribute
      def initialize(key, description)
        super(true, key, description)
      end
    end

    class OptionalAttribute < Attribute
      attr_reader :default_value

      def initialize(key, description, default_value)
        super(false, key, description)
        @default_value = default_value
      end
    end
  end
end

