class Search < ActiveRecord::Base
  def service
    @@SearchService ||= SearchService.new
  end

  def find_stores(zip)
    service.find_stores(zip)
  end
end
