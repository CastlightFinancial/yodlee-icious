require 'rubygems'
require "json"
require 'logger'
require 'faraday'
require 'socksify'
require "byebug"
require 'socksify/http'
require "active_support/core_ext/string"
require "active_support/core_ext/hash"


require "yodleeicious/version"
require "yodleeicious/unexpected_response_error"
require "yodleeicious/config"
require "yodleeicious/parameter_translator"
require "yodleeicious/response"
require "yodleeicious/yodlee_api"

class Faraday::Adapter::NetHttp
  def net_http_connection(env)
    proxy = env[:request][:proxy]
    if proxy && !proxy.empty?
      if proxy[:socks]
        # TCPSocket.socks_username = proxy[:user] if proxy[:user]
        # TCPSocket.socks_password = proxy[:password] if proxy[:password]
        Net::HTTP::SOCKSProxy(proxy[:uri].host, proxy[:uri].port)
      else
        Net::HTTP::Proxy(proxy[:uri].host, proxy[:uri].port, proxy[:uri].user, proxy[:uri].password)
      end
    else
        Net::HTTP
    end.new(env[:url].host, env[:url].port)
  end
end
