require "marqeta/config"
require "marqeta/request"
require "marqeta/api"

module Marqeta
  def self.configure(&block)
    @config = Config.new

    yield @config

    nil
  end

  def self.config
    @config
  end
end
