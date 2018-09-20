##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /

require 'spec_helper.rb'

describe 'IpAddress' do
  it "can read" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.api.v2010.accounts('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa') \
                       .sip \
                       .ip_access_control_lists('ALaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa') \
                       .ip_addresses.list()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://api.twilio.com/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/SIP/IpAccessControlLists/ALaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/IpAddresses.json',
    ))).to eq(true)
  end

  it "receives read_full responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "end": 0,
          "first_page_uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/SIP/IpAccessControlLists/ALaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/IpAddresses.json?PageSize=50&Page=0",
          "ip_addresses": [
              {
                  "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "date_created": "Mon, 20 Jul 2015 17:27:10 +0000",
                  "date_updated": "Mon, 20 Jul 2015 17:27:10 +0000",
                  "friendly_name": "aaa",
                  "ip_access_control_list_sid": "ALaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "ip_address": "192.1.1.2",
                  "sid": "IPaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/SIP/IpAccessControlLists/ALaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/IpAddresses/IPaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json"
              }
          ],
          "last_page_uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/SIP/IpAccessControlLists/ALaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/IpAddresses.json?PageSize=50&Page=0",
          "next_page_uri": null,
          "num_pages": 1,
          "page": 0,
          "page_size": 50,
          "previous_page_uri": null,
          "start": 0,
          "total": 1,
          "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/SIP/IpAccessControlLists/ALaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/IpAddresses.json?PageSize=50&Page=0"
      }
      ]
    ))

    actual = @client.api.v2010.accounts('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa') \
                              .sip \
                              .ip_access_control_lists('ALaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa') \
                              .ip_addresses.list()

    expect(actual).to_not eq(nil)
  end

  it "receives read_empty responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "end": 0,
          "first_page_uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/SIP/IpAccessControlLists/ALaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/IpAddresses.json?PageSize=50&Page=0",
          "ip_addresses": [],
          "last_page_uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/SIP/IpAccessControlLists/ALaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/IpAddresses.json?PageSize=50&Page=0",
          "next_page_uri": null,
          "num_pages": 1,
          "page": 0,
          "page_size": 50,
          "previous_page_uri": null,
          "start": 0,
          "total": 1,
          "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/SIP/IpAccessControlLists/ALaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/IpAddresses.json?PageSize=50&Page=0"
      }
      ]
    ))

    actual = @client.api.v2010.accounts('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa') \
                              .sip \
                              .ip_access_control_lists('ALaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa') \
                              .ip_addresses.list()

    expect(actual).to_not eq(nil)
  end

  it "can create" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.api.v2010.accounts('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa') \
                       .sip \
                       .ip_access_control_lists('ALaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa') \
                       .ip_addresses.create(friendly_name: 'friendly_name', ip_address: 'ip_address')
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {'FriendlyName' => 'friendly_name', 'IpAddress' => 'ip_address', }
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'post',
        url: 'https://api.twilio.com/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/SIP/IpAccessControlLists/ALaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/IpAddresses.json',
        data: values,
    ))).to eq(true)
  end

  it "receives create responses" do
    @holodeck.mock(Twilio::Response.new(
        201,
      %q[
      {
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "date_created": "Mon, 20 Jul 2015 17:27:10 +0000",
          "date_updated": "Mon, 20 Jul 2015 17:27:10 +0000",
          "friendly_name": "aaa",
          "ip_access_control_list_sid": "ALaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "ip_address": "192.1.1.2",
          "sid": "IPaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/SIP/IpAccessControlLists/ALaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/IpAddresses/IPaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json"
      }
      ]
    ))

    actual = @client.api.v2010.accounts('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa') \
                              .sip \
                              .ip_access_control_lists('ALaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa') \
                              .ip_addresses.create(friendly_name: 'friendly_name', ip_address: 'ip_address')

    expect(actual).to_not eq(nil)
  end

  it "can fetch" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.api.v2010.accounts('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa') \
                       .sip \
                       .ip_access_control_lists('ALaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa') \
                       .ip_addresses('IPaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').fetch()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://api.twilio.com/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/SIP/IpAccessControlLists/ALaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/IpAddresses/IPaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json',
    ))).to eq(true)
  end

  it "receives fetch responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "date_created": "Mon, 20 Jul 2015 17:27:10 +0000",
          "date_updated": "Mon, 20 Jul 2015 17:27:10 +0000",
          "friendly_name": "aaa",
          "ip_access_control_list_sid": "ALaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "ip_address": "192.1.1.2",
          "sid": "IPaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/SIP/IpAccessControlLists/ALaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/IpAddresses/IPaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json"
      }
      ]
    ))

    actual = @client.api.v2010.accounts('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa') \
                              .sip \
                              .ip_access_control_lists('ALaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa') \
                              .ip_addresses('IPaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').fetch()

    expect(actual).to_not eq(nil)
  end

  it "can update" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.api.v2010.accounts('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa') \
                       .sip \
                       .ip_access_control_lists('ALaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa') \
                       .ip_addresses('IPaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').update()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'post',
        url: 'https://api.twilio.com/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/SIP/IpAccessControlLists/ALaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/IpAddresses/IPaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json',
    ))).to eq(true)
  end

  it "receives update responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "date_created": "Mon, 20 Jul 2015 17:27:10 +0000",
          "date_updated": "Mon, 20 Jul 2015 17:27:10 +0000",
          "friendly_name": "aaa",
          "ip_access_control_list_sid": "ALaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "ip_address": "192.1.1.2",
          "sid": "IPaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/SIP/IpAccessControlLists/ALaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/IpAddresses/IPaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json"
      }
      ]
    ))

    actual = @client.api.v2010.accounts('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa') \
                              .sip \
                              .ip_access_control_lists('ALaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa') \
                              .ip_addresses('IPaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').update()

    expect(actual).to_not eq(nil)
  end

  it "can delete" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.api.v2010.accounts('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa') \
                       .sip \
                       .ip_access_control_lists('ALaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa') \
                       .ip_addresses('IPaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').delete()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'delete',
        url: 'https://api.twilio.com/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/SIP/IpAccessControlLists/ALaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/IpAddresses/IPaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json',
    ))).to eq(true)
  end

  it "receives delete responses" do
    @holodeck.mock(Twilio::Response.new(
        204,
      nil,
    ))

    actual = @client.api.v2010.accounts('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa') \
                              .sip \
                              .ip_access_control_lists('ALaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa') \
                              .ip_addresses('IPaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').delete()

    expect(actual).to eq(true)
  end
end