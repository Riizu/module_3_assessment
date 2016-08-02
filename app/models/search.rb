class Search
  def service
    @@SearchService ||= SearchService.new
  end

  def find_stores(zip)
    hashed_result = service.find_stores(zip)
    Result.new(hashed_result)
  end
end
