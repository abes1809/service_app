##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /

require 'spec_helper.rb'

describe 'InstalledAddOnExtension' do
  it "can fetch" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.preview.marketplace.installed_add_ons('XEaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa') \
                                 .extensions('XFaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').fetch()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://preview.twilio.com/marketplace/InstalledAddOns/XEaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Extensions/XFaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',
    ))).to eq(true)
  end

  it "receives fetch responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "sid": "XFaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "installed_add_on_sid": "XEaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "friendly_name": "Incoming Voice Call",
          "product_name": "Programmable Voice",
          "unique_name": "voice-incoming",
          "enabled": true,
          "url": "https://preview.twilio.com/marketplace/InstalledAddOns/XEaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Extensions/XFaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
      }
      ]
    ))

    actual = @client.preview.marketplace.installed_add_ons('XEaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa') \
                                        .extensions('XFaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').fetch()

    expect(actual).to_not eq(nil)
  end

  it "can update" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.preview.marketplace.installed_add_ons('XEaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa') \
                                 .extensions('XFaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').update(enabled: true)
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {'Enabled' => true, }
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'post',
        url: 'https://preview.twilio.com/marketplace/InstalledAddOns/XEaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Extensions/XFaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',
        data: values,
    ))).to eq(true)
  end

  it "receives update responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "sid": "XFaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "installed_add_on_sid": "XEaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "friendly_name": "Incoming Voice Call",
          "product_name": "Programmable Voice",
          "unique_name": "voice-incoming",
          "enabled": false,
          "url": "https://preview.twilio.com/marketplace/InstalledAddOns/XEaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Extensions/XFaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
      }
      ]
    ))

    actual = @client.preview.marketplace.installed_add_ons('XEaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa') \
                                        .extensions('XFaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').update(enabled: true)

    expect(actual).to_not eq(nil)
  end

  it "can read" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.preview.marketplace.installed_add_ons('XEaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa') \
                                 .extensions.list()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://preview.twilio.com/marketplace/InstalledAddOns/XEaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Extensions',
    ))).to eq(true)
  end

  it "receives read_full responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "extensions": [
              {
                  "sid": "XFaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "installed_add_on_sid": "XEaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "friendly_name": "Incoming Voice Call",
                  "product_name": "Programmable Voice",
                  "unique_name": "voice-incoming",
                  "enabled": true,
                  "url": "https://preview.twilio.com/marketplace/InstalledAddOns/XEaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Extensions/XFaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
              }
          ],
          "meta": {
              "page": 0,
              "page_size": 50,
              "first_page_url": "https://preview.twilio.com/marketplace/InstalledAddOns/XEaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Extensions?PageSize=50&Page=0",
              "previous_page_url": null,
              "url": "https://preview.twilio.com/marketplace/InstalledAddOns/XEaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Extensions?PageSize=50&Page=0",
              "next_page_url": null,
              "key": "extensions"
          }
      }
      ]
    ))

    actual = @client.preview.marketplace.installed_add_ons('XEaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa') \
                                        .extensions.list()

    expect(actual).to_not eq(nil)
  end

  it "receives read_empty responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "extensions": [],
          "meta": {
              "page": 0,
              "page_size": 50,
              "first_page_url": "https://preview.twilio.com/marketplace/InstalledAddOns/XEaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Extensions?PageSize=50&Page=0",
              "previous_page_url": null,
              "url": "https://preview.twilio.com/marketplace/InstalledAddOns/XEaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Extensions?PageSize=50&Page=0",
              "next_page_url": null,
              "key": "extensions"
          }
      }
      ]
    ))

    actual = @client.preview.marketplace.installed_add_ons('XEaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa') \
                                        .extensions.list()

    expect(actual).to_not eq(nil)
  end
end