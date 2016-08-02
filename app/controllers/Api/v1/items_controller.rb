class Api::V1::ItemsController < ApiBaseController
  def index
    render json: Item.all
  end

  def show
    render json: Item.find(params[:id])
  end

  def destroy
    item = Item.find(params[:id])
    item.delete
    render json: item, status: 204
  end

  def create

  end
end
