class SearchController < ApplicationController
  def index
    @results = search_handler.find_stores(params[:zip])
  end

  def show
    @store = search_handler.find_store(params[:id])
  end
end
