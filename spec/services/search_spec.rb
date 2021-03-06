require 'rails_helper'

RSpec.describe SearchService, :vcr do
  it "has a base connection" do
    ss = SearchService.new

    url_prefix = ss.connection.url_prefix.to_s
    api_key = ss.connection.params["apiKey"]
    response_format = ss.connection.params["format"]

    expect(url_prefix).to eq "https://api.bestbuy.com/"
    expect(api_key).to eq ENV["BEST_BUY"]
    expect(response_format).to eq "json"
  end

  it "searches for stores by zip" do
    ss = SearchService.new

    result = ss.find_stores('80202')
    first_store = result["stores"].first

    expect(result["from"]).to eq 1
    expect(result["to"]).to eq 15
    expect(result["total"]).to eq 17
    expect(result["currentPage"]).to eq 1
    expect(result["totalPages"]).to eq 2
    expect(result["stores"].count).to eq 15

    expect(first_store["longName"]).to eq "Best Buy Mobile - Cherry Creek Shopping Center"
    expect(first_store["city"]).to eq "Denver"
    expect(first_store["distance"]).to eq 3.25
    expect(first_store["phone"]).to eq "303-270-9189"
    expect(first_store["storeType"]).to eq "Mobile"
    expect(first_store["storeId"]).to eq 2740
  end

  it "searches for a by id" do
    ss = SearchService.new

    store = ss.find_store(2740)

    expect(store["longName"]).to eq "Best Buy Mobile - Cherry Creek Shopping Center"
    expect(store["city"]).to eq "Denver"
    expect(store["region"]).to eq "CO"
    expect(store["postalCode"]).to eq "80206"
    expect(store["storeType"]).to eq "Mobile"
    expect(store["address"]).to eq "3000 East First Ave"
    expect(store["storeId"]).to eq 2740
    expect(store["hoursAmPm"]).to eq "Mon: 10am-9pm; Tue: 10am-9pm; Wed: 10am-9pm; Thurs: 10am-9pm; Fri: 10am-9pm; Sat: 10am-9pm; Sun: 11am-6pm"
  end
end
