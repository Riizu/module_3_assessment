class Store
  attr_reader :long_name, :city, :distance, :phone, :type
  def initialize(store)
    @long_name = store["longName"]
    @city = store["city"]
    @distance = store["distance"]
    @phone = store["phone"]
    @type = store["storeType"]
  end
end
