class SearchService
  attr_reader :connection
  def initialize
    @connection = Faraday.new("https://api.bestbuy.com/")
    @connection.params["apiKey"] = ENV["BEST_BUY"]
    @connection.params["format"] = "json"
  end

  def find_stores(zip)
    response = connection.get("v1/stores(area(#{zip},25))") do |conn|
      conn.params["show"] = "longName,city,distance,phone,storeType,storeId"
      conn.params["pageSize"] = "15"
    end

    parse(response.body)
  end

  def find_store(id)
    response = connection.get("https://api.bestbuy.com/v1/stores(storeId=#{id})") do |conn|
      conn.params["show"] = "longName,storeType,address,region,postalCode,city,hoursAmPm,storeId"
      conn.params["pageSize"] = "1"
    end

    parse(response.body)["stores"].first
  end


  private

  def parse(body)
    JSON.parse(body)
  end
end
