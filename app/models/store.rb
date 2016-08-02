class Store
  attr_reader :long_name, :city, :distance, :phone, :type, :id
  
  def initialize(store)
    @long_name = store["longName"]
    @city = store["city"]
    @distance = store["distance"]
    @phone = store["phone"]
    @type = store["storeType"]
    @id = store["storeId"]
  end
end
