require 'rails_helper'

describe "Items Endpoint" do
  it "should return a collection of all items" do
    items = create_list(:item, 4)
    expected_item = items.first

    get "/api/v1/items"

    expect(response).to be_success

    parsed_items = JSON.parse(response.body)
    single_item = parsed_items.first

    expect(parsed_items.count).to eq 4
    expect(single_item["name"]).to eq expected_item.name
    expect(single_item["description"]).to eq expected_item.description
    expect(single_item["image_url"]).to eq expected_item.image_url
    expect(single_item["created_at"]).to eq expected_item.created_at.to_s
    expect(single_item["updated_at"]).to eq expected_item.updated_at.to_s
  end

  it "should return a single item" do
    items = create_list(:item, 4)
    expected_item = items.first

    get "/api/v1/items/#{expected_item.id}"

    expect(response).to be_success

    parsed_item = JSON.parse(response.body)

    expect(parsed_item["name"]).to eq expected_item.name
    expect(parsed_item["description"]).to eq expected_item.description
    expect(parsed_item["image_url"]).to eq expected_item.image_url
    expect(parsed_item["created_at"]).to eq expected_item.created_at
    expect(parsed_item["updated_at"]).to eq expected_item.updated_at
  end

  it "should delete an item" do
    items = create_list(:item, 4)
    item_to_be_deleted = items.first

    delete "/api/v1/items/#{item_to_be_deleted.id}"

    expect(response.status).to eq 204

    get "/api/v1/items"

    remaining_items = JSON.parse(response.body)

    expect(remaining_items.count).to eq 3
  end

  it "should create an item" do
    post "/api/v1/items?name=Test&description=Description&image_url=http://example.com/image.jpg"

    expect(response.status).to eq 201

    new_item = JSON.parse(response.body)

    expect(new_item["name"]).to eq "Test"
    expect(new_item["description"]).to eq "Description"
    expect(new_item["image_url"]).to eq "http://example.com/image.jpg"
  end
end
