module Marqeta
  class Config
    attr_accessor :version,
                  :host,
                  :username,
                  :password,
                  :proxy

    def initialize
      # API defaults
      @version = 'v3'
    end
  end
end
