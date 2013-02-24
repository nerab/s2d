require 'singleton'
require 'yaml'

#
# Concept based on [t](https://github.com/sferik/t)'s RCFile
#
module S2D
  module Configuration
    class Repository
      include Singleton

      attr_reader :path

      def initialize
        @path = File.join(File.expand_path('~'), FILE_NAME)
        @data = load
      end

      def load
        YAML.load_file(@path)
      rescue Errno::ENOENT
        default_structure
      end

      def devices
        @data[:devices].keys
      end

      def device(key)
        selected = @data[:devices][key]

        if selected.nil?
          nil
        else
          Mappers::DeviceMapper.to_object(selected)
        end
      end

      def add_device(device, activate = false)
        @data[:devices][device.name.to_sym] = Mappers::DeviceMapper.to_hash(device)
        self.active_device = device if activate
        write
      end

      def active_device
        device(:default)
      end

      def active_device=(device)
        add_device(device, false) unless device(device.name.to_sym)
        @data[:devices][:default] = device.name.to_sym
        write
      end

      def empty?
        @data == default_structure
      end

      def reset
        self.send(:initialize)
      end

    private
      FILE_NAME = '.s2drc'

      def default_structure
        { :devices => {}}
      end

      def write
        File.open(@path, File::RDWR|File::TRUNC|File::CREAT, 0600) do |rcfile|
          rcfile.write(@data.to_yaml)
        end
      end
    end
  end
end
