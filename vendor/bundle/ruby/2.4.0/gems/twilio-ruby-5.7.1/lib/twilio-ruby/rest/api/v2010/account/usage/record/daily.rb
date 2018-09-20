##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /

module Twilio
  module REST
    class Api < Domain
      class V2010 < Version
        class AccountContext < InstanceContext
          class UsageList < ListResource
            class RecordList < ListResource
              class DailyList < ListResource
                ##
                # Initialize the DailyList
                # @param [Version] version Version that contains the resource
                # @param [String] account_sid A 34 character string that uniquely identifies this
                #   resource.
                # @return [DailyList] DailyList
                def initialize(version, account_sid: nil)
                  super(version)

                  # Path Solution
                  @solution = {account_sid: account_sid}
                  @uri = "/Accounts/#{@solution[:account_sid]}/Usage/Records/Daily.json"
                end

                ##
                # Lists DailyInstance records from the API as a list.
                # Unlike stream(), this operation is eager and will load `limit` records into
                # memory before returning.
                # @param [daily.Category] category The category
                # @param [Date] start_date The start_date
                # @param [Date] end_date The end_date
                # @param [Integer] limit Upper limit for the number of records to return. stream()
                #    guarantees to never return more than limit.  Default is no limit
                # @param [Integer] page_size Number of records to fetch per request, when
                #    not set will use the default value of 50 records.  If no page_size is defined
                #    but a limit is defined, stream() will attempt to read the limit with the most
                #    efficient page size, i.e. min(limit, 1000)
                # @return [Array] Array of up to limit results
                def list(category: :unset, start_date: :unset, end_date: :unset, limit: nil, page_size: nil)
                  self.stream(
                      category: category,
                      start_date: start_date,
                      end_date: end_date,
                      limit: limit,
                      page_size: page_size
                  ).entries
                end

                ##
                # Streams DailyInstance records from the API as an Enumerable.
                # This operation lazily loads records as efficiently as possible until the limit
                # is reached.
                # @param [daily.Category] category The category
                # @param [Date] start_date The start_date
                # @param [Date] end_date The end_date
                # @param [Integer] limit Upper limit for the number of records to return. stream()
                #    guarantees to never return more than limit. Default is no limit.
                # @param [Integer] page_size Number of records to fetch per request, when
                #    not set will use the default value of 50 records. If no page_size is defined
                #    but a limit is defined, stream() will attempt to read the limit with the most
                #    efficient page size, i.e. min(limit, 1000)
                # @return [Enumerable] Enumerable that will yield up to limit results
                def stream(category: :unset, start_date: :unset, end_date: :unset, limit: nil, page_size: nil)
                  limits = @version.read_limits(limit, page_size)

                  page = self.page(
                      category: category,
                      start_date: start_date,
                      end_date: end_date,
                      page_size: limits[:page_size],
                  )

                  @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
                end

                ##
                # When passed a block, yields DailyInstance records from the API.
                # This operation lazily loads records as efficiently as possible until the limit
                # is reached.
                def each
                  limits = @version.read_limits

                  page = self.page(page_size: limits[:page_size], )

                  @version.stream(page,
                                  limit: limits[:limit],
                                  page_limit: limits[:page_limit]).each {|x| yield x}
                end

                ##
                # Retrieve a single page of DailyInstance records from the API.
                # Request is executed immediately.
                # @param [daily.Category] category The category
                # @param [Date] start_date The start_date
                # @param [Date] end_date The end_date
                # @param [String] page_token PageToken provided by the API
                # @param [Integer] page_number Page Number, this value is simply for client state
                # @param [Integer] page_size Number of records to return, defaults to 50
                # @return [Page] Page of DailyInstance
                def page(category: :unset, start_date: :unset, end_date: :unset, page_token: :unset, page_number: :unset, page_size: :unset)
                  params = Twilio::Values.of({
                      'Category' => category,
                      'StartDate' => Twilio.serialize_iso8601_date(start_date),
                      'EndDate' => Twilio.serialize_iso8601_date(end_date),
                      'PageToken' => page_token,
                      'Page' => page_number,
                      'PageSize' => page_size,
                  })
                  response = @version.page(
                      'GET',
                      @uri,
                      params
                  )
                  DailyPage.new(@version, response, @solution)
                end

                ##
                # Retrieve a single page of DailyInstance records from the API.
                # Request is executed immediately.
                # @param [String] target_url API-generated URL for the requested results page
                # @return [Page] Page of DailyInstance
                def get_page(target_url)
                  response = @version.domain.request(
                      'GET',
                      target_url
                  )
                  DailyPage.new(@version, response, @solution)
                end

                ##
                # Provide a user friendly representation
                def to_s
                  '#<Twilio.Api.V2010.DailyList>'
                end
              end

              class DailyPage < Page
                ##
                # Initialize the DailyPage
                # @param [Version] version Version that contains the resource
                # @param [Response] response Response from the API
                # @param [Hash] solution Path solution for the resource
                # @return [DailyPage] DailyPage
                def initialize(version, response, solution)
                  super(version, response)

                  # Path Solution
                  @solution = solution
                end

                ##
                # Build an instance of DailyInstance
                # @param [Hash] payload Payload response from the API
                # @return [DailyInstance] DailyInstance
                def get_instance(payload)
                  DailyInstance.new(@version, payload, account_sid: @solution[:account_sid], )
                end

                ##
                # Provide a user friendly representation
                def to_s
                  '<Twilio.Api.V2010.DailyPage>'
                end
              end

              class DailyInstance < InstanceResource
                ##
                # Initialize the DailyInstance
                # @param [Version] version Version that contains the resource
                # @param [Hash] payload payload that contains response from Twilio
                # @param [String] account_sid A 34 character string that uniquely identifies this
                #   resource.
                # @return [DailyInstance] DailyInstance
                def initialize(version, payload, account_sid: nil)
                  super(version)

                  # Marshaled Properties
                  @properties = {
                      'account_sid' => payload['account_sid'],
                      'api_version' => payload['api_version'],
                      'category' => payload['category'],
                      'count' => payload['count'],
                      'count_unit' => payload['count_unit'],
                      'description' => payload['description'],
                      'end_date' => Twilio.deserialize_iso8601_date(payload['end_date']),
                      'price' => payload['price'].to_f,
                      'price_unit' => payload['price_unit'],
                      'start_date' => Twilio.deserialize_iso8601_date(payload['start_date']),
                      'subresource_uris' => payload['subresource_uris'],
                      'uri' => payload['uri'],
                      'usage' => payload['usage'],
                      'usage_unit' => payload['usage_unit'],
                  }
                end

                ##
                # @return [String] The account_sid
                def account_sid
                  @properties['account_sid']
                end

                ##
                # @return [String] The api_version
                def api_version
                  @properties['api_version']
                end

                ##
                # @return [daily.Category] The category
                def category
                  @properties['category']
                end

                ##
                # @return [String] The count
                def count
                  @properties['count']
                end

                ##
                # @return [String] The count_unit
                def count_unit
                  @properties['count_unit']
                end

                ##
                # @return [String] The description
                def description
                  @properties['description']
                end

                ##
                # @return [Date] The end_date
                def end_date
                  @properties['end_date']
                end

                ##
                # @return [String] The price
                def price
                  @properties['price']
                end

                ##
                # @return [String] The price_unit
                def price_unit
                  @properties['price_unit']
                end

                ##
                # @return [Date] The start_date
                def start_date
                  @properties['start_date']
                end

                ##
                # @return [String] The subresource_uris
                def subresource_uris
                  @properties['subresource_uris']
                end

                ##
                # @return [String] The uri
                def uri
                  @properties['uri']
                end

                ##
                # @return [String] The usage
                def usage
                  @properties['usage']
                end

                ##
                # @return [String] The usage_unit
                def usage_unit
                  @properties['usage_unit']
                end

                ##
                # Provide a user friendly representation
                def to_s
                  "<Twilio.Api.V2010.DailyInstance>"
                end

                ##
                # Provide a detailed, user friendly representation
                def inspect
                  "<Twilio.Api.V2010.DailyInstance>"
                end
              end
            end
          end
        end
      end
    end
  end
end