require 'rails_helper'

RSpec.describe SearchService, :vcr do
  it "searches for stores by zip" do
    result = SearchService.find_stores('80202')

    expect(result["from"]).to eq 1
    expect(result["to"]).to eq 15
    expect(result["total"]).to eq 17
    expect(result["currentPage"]).to eq 1
    expect(result["total_pages"]).to eq 2
    expect(results["stores"].count).to eq 15
  end
end
