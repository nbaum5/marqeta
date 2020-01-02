require "marqeta/request"

module Marqeta

  class User
    def self.create(options)
      path = '/users'
      Request.post(path, options)
    end
    def self.update(token, options)
      path = "/users/#{token}"
      Request.put(path, options)
    end
    def self.find(token)
      path = "/users/#{token}"
      Request.get(path)
    end
    def self.get_balance(token)
      path = "/users/#{token}/balances"
      Request.get(path)
    end
    def self.create_single_use_token(options)
      path = '/users/auth/onetime'
      Request.post(path, options)
    end
    def self.create_client_access_token(card_token)
      path = "/users/auth/clientaccesstoken"
      Request.post(path, {card_token: card_token})
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
    module Fulfillment
      module Status
        ISSUED = "ISSUED"
        ORDERED = "ORDERED"
        REORDERED = "REORDERED"
        REJECTED = "REJECTED"
        SHIPPED = "SHIPPED"
        DELIVERED = "DELIVERED"
        DIGITALLY_PRESENTED = "DIGITALLY_PRESENTED"
      end
    end

    def self.create(options)
      path = "/cards"
      Request.post(path, options)
    end
    def self.find(token)
      path = "/cards/#{token}"
      Request.get(path)
    end

    def self.create_card_transition(options)
      path = "/cardtransitions"
      Request.post(path, options)
    end
  end

  class BulkCardOrder
    def self.create(options)
      path = "/bulkissuances"
      Request.post(path, options)
    end
    def self.find(token)
      path = "/bulkissuances/#{token}"
      Request.get(path)
    end
    def self.list(options={})
      path = "/bulkissuances"
      Request.get(path, options)
    end
  end

  class Order
    def self.create_gpa_order(options)
      path = "/gpaorders"
      Request.post(path, options)
    end
    def self.retrieve_gpa_order(token)
      path = "/gpaorders/#{token}"
      Request.get(path)
    end
    def self.unload_gpa_order(options)
      path = "/gpaorders/unloads"
      Request.post(path, options)
    end
    def self.retrieve_gpa_unload(token)
      path = "/gpaorders/unloads/#{token}"
      Request.get(path)
    end
  end

  class Transaction
    def self.list(options={})
      path = "/transactions"
      Request.get(path, options)
    end
  end

  class FeeTransfer
    def self.create(options={})
      path = "/feetransfers"
      Request.post(path, options)
    end
    def self.find(token)
      path = "/feetransfers/#{token}"
      Request.get(path)
    end
  end

  class ProgramTransfer
    def self.list(options={})
      path = "/programtransfers"
      Request.get(path)
    end
    def self.create(options={})
      path = "/programtransfers"
      Request.post(path, options)
    end
    def self.find(token)
      path = "/programtransfers/#{token}"
      Request.get(path)
    end
  end

  class CardProduct
    def self.create(options)
      path = "/cardproducts"
      Request.post(path, options)
    end
    def self.find(token)
      path = "/cardproducts/#{token}"
      Request.get(path)
    end
    def self.list(options={})
      path = "/cardproducts"
      Request.get(path, options)
    end
  end

  class Webhook
    def self.list(options={})
      path = "/webhooks"
      Request.get(path, options)
    end
    def self.create(options={})
      path = "/webhooks"
      Request.post(path, options)
    end
    def self.find(token)
      path = "/webhooks/#{token}"
      Request.get(path)
    end
    def self.update(token)
      path = "/webhooks/#{token}"
      Request.put(path)
    end
    def self.ping(token)
      path = "/webhooks/#{token}/ping"
      Request.get(path)
    end
    def self.resend_event_notification(token, event)
      path = "/webhooks/#{token}/#{event[:type]}/#{event[:token]}"
      Request.post(path, {})
    end
  end
end
