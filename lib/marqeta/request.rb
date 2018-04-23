require 'httparty'

module Marqeta
  class Request
    @@default_options = nil
    @@debug_mode = false

    def self.set_debug_mode(val)
      @@debug_mode = val
    end

    def self.default_options
      return @@default_options if @@default_options

      # Set basic auth.
      @@default_options = { :basic_auth => { :username => Marqeta.config.username,
                                             :password => Marqeta.config.password },
                            :headers => { 'content-type' => 'application/json',
                                          'accept' => 'application/json' },
                            :debug_output => (@@debug_mode ? $stdout : nil)
                          }

      # Set proxy if production. Heroku doesn't have a static IP, so we
      # use a whitelisted proxy IP.
      if Marqeta.config.proxy.present?
        proxy_uri = URI(Marqeta.config.proxy)
        proxy_options = {
                          :http_proxyaddr => proxy_uri.host,
                          :http_proxyport => proxy_uri.port,
                          :http_proxyuser => proxy_uri.user,
                          :http_proxypass => proxy_uri.password
                        }
        @@default_options.merge!(proxy_options)
      end

      @@default_options
    end

    def self.get_url(path)
      [Marqeta.config.host, Marqeta.config.version, path].join('/').gsub(/([^:])\/\//, '\1/')
    end

    def self.get(path, data={})
      path = [path, URI.encode_www_form(data)].join('?') if data.present?
      HTTParty.get(get_url(path), default_options)
    end
    def self.post(path, data={})
      HTTParty.post(get_url(path), { body: data.to_json }.merge(default_options))
    end
    def self.put(path, data={})
      HTTParty.put(get_url(path), { body: data.to_json }.merge(default_options))
    end
  end
end
