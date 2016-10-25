require "marqeta/request"

module Marqeta

  class User
    def self.create(options)
      path = '/users'
      Request.post(path, options)
    end
    def self.get(token)
      path = "/users/#{token}"
      Request.get(path)
    end
    def self.get_balance(token)
      path = "/users/#{token}/balances"
      Request.get(path)
    end
  end

  class Card
    module State
      ACTIVE = "ACTIVE"
      SUSPENDED = "SUSPENDED"
      TERMINATED = "TERMINATED"
    end
    module TransitionChannel
      API = "API"
      IVR = "IVR"
      FRAUD = "FRAUD"
      ADMIN = "ADMIN"
      SYSTEM = "SYSTEM"
      UNSUPPORTED = "UNSUPPORTED"
    end

    def self.create(options)
      path = "/cards"
      Request.post(path, options)
    end

    def self.create_card_transition(options)
      path = "/cardtransitions"
      Request.post(path, options)
    end
  end

  class Order
    def self.create_gpa_order(options)
      path = "/gpaorders"
      Request.post(path, options)
    end
  end
end
