module Yodleeicious
  class Config

    class << self
      attr_accessor :base_url
      attr_accessor :fin_app_id
      attr_accessor :cobranded_app_name
      attr_accessor :cobranded_username
      attr_accessor :cobranded_password
      attr_accessor :proxy_url
      attr_accessor :logger
    end

    self.logger       = Logger.new(STDOUT)
    self.logger.level = Logger::WARN

  end
end
