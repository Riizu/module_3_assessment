require 'rails_helper'

RSpec.describe Search, type: :model do
  it "has a service" do
    search = Search.new

    ss = search.service

    expect(ss.class).to eq SearchService
  end

  it "searches for stores by zip", :vcr do
    search = Search.new

    result = search.find_stores("80202")
    store = result.stores.first

    expect(result.start).to eq 1
    expect(result.end).to eq 15
    expect(result.total).to eq 17
    expect(result.current_page).to eq 1
    expect(result.total_pages).to eq 2

    expect(store.long_name).to eq "Best Buy Mobile - Cherry Creek Shopping Center"
    expect(store.city).to eq "Denver"
    expect(store.distance).to eq 3.25
    expect(store.phone).to eq "303-270-9189"
    expect(store.type).to eq "Mobile"
  end
end
