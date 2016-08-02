require 'rails_helper'

RSpec.describe SearchService, :vcr do
  it "has a base connection" do
    ss = SearchService.new

    url_prefix = ss.connection.url_prefix.to_s
    api_key = ss.connection.params["api_key"]

    expect(url_prefix).to eq "https://api.bestbuy.com/"
    expect(api_key).to eq ENV["BEST_BY"]
  end

  it "searches for stores by zip" do
    ss = SearchService.new

    result = ss.find_stores('80202')

    expect(result["from"]).to eq 1
    expect(result["to"]).to eq 15
    expect(result["total"]).to eq 17
    expect(result["currentPage"]).to eq 1
    expect(result["total_pages"]).to eq 2
    expect(results["stores"].count).to eq 15
  end
end
