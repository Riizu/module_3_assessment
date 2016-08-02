class Store
  attr_reader :long_name, :city, :distance, :phone, :type, :id, :hours,
              :zip, :region

  def initialize(store)
    @long_name = store["longName"]
    @city = store["city"]
    @distance = store["distance"]
    @phone = store["phone"]
    @type = store["storeType"]
    @id = store["storeId"]
    @hours = make_hours(store["hoursAmPm"])
    @address = make_address(store["address"])
    @region = store["region"]
    @zip = store["postalCode"]
  end

  def make_hours(hours)
    if hours != nil
      hours.split(";")
    end
  end

  def make_address(address)
    "#{address}, #{city}, #{region} #{zip}"
  end
end
