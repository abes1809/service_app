##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /

module Twilio
  module REST
    class Api
      class V2010 < Version
        ##
        # Initialize the V2010 version of Api
        def initialize(domain)
          super
          @version = '2010-04-01'
          @accounts = nil
          @account = nil
        end

        ##
        # @param [String] sid The Account Sid that uniquely identifies the account to
        #   fetch
        # @return [Twilio::REST::Api::V2010::AccountContext] if sid was passed.
        # @return [Twilio::REST::Api::V2010::AccountList]
        def accounts(sid=:unset)
          if sid.nil?
            raise ArgumentError, 'sid cannot be nil'
          elsif sid == :unset
            @accounts ||= AccountList.new self
          else
            AccountContext.new(self, sid)
          end
        end

        ##
        # Account provided as the authenticating account
        def account
          @account ||= AccountContext.new(self, @domain.client.account_sid)
        end

        ##
        # Setter to override the primary account
        def account=(value)
          @account = value
        end

        def addresses(sid=:unset)
          self.account.addresses(sid)
        end

        def applications(sid=:unset)
          self.account.applications(sid)
        end

        def authorized_connect_apps(connect_app_sid=:unset)
          self.account.authorized_connect_apps(connect_app_sid)
        end

        def available_phone_numbers(country_code=:unset)
          self.account.available_phone_numbers(country_code)
        end

        def calls(sid=:unset)
          self.account.calls(sid)
        end

        def conferences(sid=:unset)
          self.account.conferences(sid)
        end

        def connect_apps(sid=:unset)
          self.account.connect_apps(sid)
        end

        def incoming_phone_numbers(sid=:unset)
          self.account.incoming_phone_numbers(sid)
        end

        def keys(sid=:unset)
          self.account.keys(sid)
        end

        def messages(sid=:unset)
          self.account.messages(sid)
        end

        def new_keys
          self.account.new_keys()
        end

        def new_signing_keys
          self.account.new_signing_keys()
        end

        def notifications(sid=:unset)
          self.account.notifications(sid)
        end

        def outgoing_caller_ids(sid=:unset)
          self.account.outgoing_caller_ids(sid)
        end

        def queues(sid=:unset)
          self.account.queues(sid)
        end

        def recordings(sid=:unset)
          self.account.recordings(sid)
        end

        def signing_keys(sid=:unset)
          self.account.signing_keys(sid)
        end

        def sip
          self.account.sip()
        end

        def short_codes(sid=:unset)
          self.account.short_codes(sid)
        end

        def tokens
          self.account.tokens()
        end

        def transcriptions(sid=:unset)
          self.account.transcriptions(sid)
        end

        def usage
          self.account.usage()
        end

        def validation_requests
          self.account.validation_requests()
        end

        ##
        # Provide a user friendly representation
        def to_s
          '<Twilio::REST::Api::V2010>'
        end
      end
    end
  end
end