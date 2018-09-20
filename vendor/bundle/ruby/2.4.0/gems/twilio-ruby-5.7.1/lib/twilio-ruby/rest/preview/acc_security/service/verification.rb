##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /

module Twilio
  module REST
    class Preview < Domain
      class AccSecurity < Version
        class ServiceContext < InstanceContext
          ##
          # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
          class VerificationList < ListResource
            ##
            # Initialize the VerificationList
            # @param [Version] version Version that contains the resource
            # @param [String] service_sid The unique SID identifier of the Service.
            # @return [VerificationList] VerificationList
            def initialize(version, service_sid: nil)
              super(version)

              # Path Solution
              @solution = {service_sid: service_sid}
              @uri = "/Services/#{@solution[:service_sid]}/Verifications"
            end

            ##
            # Retrieve a single page of VerificationInstance records from the API.
            # Request is executed immediately.
            # @param [String] to The To phonenumber of the phone being verified
            # @param [String] channel The method in which the phone will be verified. Either
            #   sms or call
            # @param [String] custom_message A character string containing a custom message
            #   for this verification
            # @return [VerificationInstance] Newly created VerificationInstance
            def create(to: nil, channel: nil, custom_message: :unset)
              data = Twilio::Values.of({'To' => to, 'Channel' => channel, 'CustomMessage' => custom_message, })

              payload = @version.create(
                  'POST',
                  @uri,
                  data: data
              )

              VerificationInstance.new(@version, payload, service_sid: @solution[:service_sid], )
            end

            ##
            # Provide a user friendly representation
            def to_s
              '#<Twilio.Preview.AccSecurity.VerificationList>'
            end
          end

          ##
          # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
          class VerificationPage < Page
            ##
            # Initialize the VerificationPage
            # @param [Version] version Version that contains the resource
            # @param [Response] response Response from the API
            # @param [Hash] solution Path solution for the resource
            # @return [VerificationPage] VerificationPage
            def initialize(version, response, solution)
              super(version, response)

              # Path Solution
              @solution = solution
            end

            ##
            # Build an instance of VerificationInstance
            # @param [Hash] payload Payload response from the API
            # @return [VerificationInstance] VerificationInstance
            def get_instance(payload)
              VerificationInstance.new(@version, payload, service_sid: @solution[:service_sid], )
            end

            ##
            # Provide a user friendly representation
            def to_s
              '<Twilio.Preview.AccSecurity.VerificationPage>'
            end
          end

          ##
          # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
          class VerificationInstance < InstanceResource
            ##
            # Initialize the VerificationInstance
            # @param [Version] version Version that contains the resource
            # @param [Hash] payload payload that contains response from Twilio
            # @param [String] service_sid The unique SID identifier of the Service.
            # @return [VerificationInstance] VerificationInstance
            def initialize(version, payload, service_sid: nil)
              super(version)

              # Marshaled Properties
              @properties = {
                  'sid' => payload['sid'],
                  'service_sid' => payload['service_sid'],
                  'account_sid' => payload['account_sid'],
                  'to' => payload['to'],
                  'channel' => payload['channel'],
                  'status' => payload['status'],
                  'valid' => payload['valid'],
                  'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                  'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
              }
            end

            ##
            # @return [String] A string that uniquely identifies this Verification.
            def sid
              @properties['sid']
            end

            ##
            # @return [String] Service Sid.
            def service_sid
              @properties['service_sid']
            end

            ##
            # @return [String] Account Sid.
            def account_sid
              @properties['account_sid']
            end

            ##
            # @return [String] To phonenumber
            def to
              @properties['to']
            end

            ##
            # @return [verification.Channel] sms or call
            def channel
              @properties['channel']
            end

            ##
            # @return [String] pending, approved, denied or expired
            def status
              @properties['status']
            end

            ##
            # @return [Boolean] successful verification
            def valid
              @properties['valid']
            end

            ##
            # @return [Time] The date this Verification was created
            def date_created
              @properties['date_created']
            end

            ##
            # @return [Time] The date this Verification was updated
            def date_updated
              @properties['date_updated']
            end

            ##
            # Provide a user friendly representation
            def to_s
              "<Twilio.Preview.AccSecurity.VerificationInstance>"
            end

            ##
            # Provide a detailed, user friendly representation
            def inspect
              "<Twilio.Preview.AccSecurity.VerificationInstance>"
            end
          end
        end
      end
    end
  end
end