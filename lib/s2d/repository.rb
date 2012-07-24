require 'singleton'
require 'yaml'

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

      def add_device(device, activate = false)
        @data[:devices][device.name.to_sym] = Mappers::DeviceMapper.to_hash(device)
        self.active_device = device if activate
        write
      end

      def active_device
        default = devices[:default]

        if default.nil?
          raise "No default device configured"
        else
          device(default)
        end
      end

      def active_device=(device)
        devices[:default] = device.name.to_sym
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
