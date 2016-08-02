class SearchController < ApplicationController
  def index
    @results = search_handler.find_stores(params[:zip])
  end
end
