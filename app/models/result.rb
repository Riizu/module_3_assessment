class Result
  attr_reader :start, :end, :total, :current_page, :total_pages,
              :stores

  def initialize(search_hash)
    @start = search_hash["from"]
    @end = search_hash["to"]
    @total = search_hash["total"]
    @current_page = search_hash["currentPage"]
    @total_pages = search_hash["totalPages"]
    @stores = make_stores(search_hash["stores"])
  end

  def make_stores(store_hash)
    store_hash.map do |store|
      Store.new(store)
    end
  end
end
