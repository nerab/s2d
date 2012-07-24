module S2D
  class Message
    attr_accessor :subject, :body

    def initialize(subject = "from #{%x[hostname].chomp}:", body = nil)
      @subject, @body = subject, body
    end

    def valid?
      valid?
    end

    def invalid?
      @subject.nil? || @body.nil? || @subject.empty? || @body.empty?
    end
  end
end
