##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /

module Twilio
  module REST
    class Preview < Domain
      class BulkExports < Version
        ##
        # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
        class ExportList < ListResource
          ##
          # Initialize the ExportList
          # @param [Version] version Version that contains the resource
          # @return [ExportList] ExportList
          def initialize(version)
            super(version)

            # Path Solution
            @solution = {}
          end

          ##
          # Provide a user friendly representation
          def to_s
            '#<Twilio.Preview.BulkExports.ExportList>'
          end
        end

        ##
        # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
        class ExportPage < Page
          ##
          # Initialize the ExportPage
          # @param [Version] version Version that contains the resource
          # @param [Response] response Response from the API
          # @param [Hash] solution Path solution for the resource
          # @return [ExportPage] ExportPage
          def initialize(version, response, solution)
            super(version, response)

            # Path Solution
            @solution = solution
          end

          ##
          # Build an instance of ExportInstance
          # @param [Hash] payload Payload response from the API
          # @return [ExportInstance] ExportInstance
          def get_instance(payload)
            ExportInstance.new(@version, payload, )
          end

          ##
          # Provide a user friendly representation
          def to_s
            '<Twilio.Preview.BulkExports.ExportPage>'
          end
        end

        ##
        # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
        class ExportContext < InstanceContext
          ##
          # Initialize the ExportContext
          # @param [Version] version Version that contains the resource
          # @param [String] resource_type The resource_type
          # @return [ExportContext] ExportContext
          def initialize(version, resource_type)
            super(version)

            # Path Solution
            @solution = {resource_type: resource_type, }
            @uri = "/Exports/#{@solution[:resource_type]}"

            # Dependents
            @days = nil
          end

          ##
          # Fetch a ExportInstance
          # @return [ExportInstance] Fetched ExportInstance
          def fetch
            params = Twilio::Values.of({})

            payload = @version.fetch(
                'GET',
                @uri,
                params,
            )

            ExportInstance.new(@version, payload, resource_type: @solution[:resource_type], )
          end

          ##
          # Access the days
          # @return [DayList]
          # @return [DayContext]
          def days
            unless @days
              @days = DayList.new(@version, resource_type: @solution[:resource_type], )
            end

            @days
          end

          ##
          # Provide a user friendly representation
          def to_s
            context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
            "#<Twilio.Preview.BulkExports.ExportContext #{context}>"
          end
        end

        ##
        # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
        class ExportInstance < InstanceResource
          ##
          # Initialize the ExportInstance
          # @param [Version] version Version that contains the resource
          # @param [Hash] payload payload that contains response from Twilio
          # @param [String] resource_type The resource_type
          # @return [ExportInstance] ExportInstance
          def initialize(version, payload, resource_type: nil)
            super(version)

            # Marshaled Properties
            @properties = {
                'resource_type' => payload['resource_type'],
                'url' => payload['url'],
                'links' => payload['links'],
            }

            # Context
            @instance_context = nil
            @params = {'resource_type' => resource_type || @properties['resource_type'], }
          end

          ##
          # Generate an instance context for the instance, the context is capable of
          # performing various actions.  All instance actions are proxied to the context
          # @return [ExportContext] ExportContext for this ExportInstance
          def context
            unless @instance_context
              @instance_context = ExportContext.new(@version, @params['resource_type'], )
            end
            @instance_context
          end

          ##
          # @return [String] The resource_type
          def resource_type
            @properties['resource_type']
          end

          ##
          # @return [String] The url
          def url
            @properties['url']
          end

          ##
          # @return [String] The links
          def links
            @properties['links']
          end

          ##
          # Fetch a ExportInstance
          # @return [ExportInstance] Fetched ExportInstance
          def fetch
            context.fetch
          end

          ##
          # Access the days
          # @return [days] days
          def days
            context.days
          end

          ##
          # Provide a user friendly representation
          def to_s
            values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
            "<Twilio.Preview.BulkExports.ExportInstance #{values}>"
          end

          ##
          # Provide a detailed, user friendly representation
          def inspect
            values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
            "<Twilio.Preview.BulkExports.ExportInstance #{values}>"
          end
        end
      end
    end
  end
end