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
    render json: '', status: 204
  end

  def create
    item = Item.create(item_params)
    render json: item, status: 201
  end

  private

  def item_params
    params.permit(:name, :description, :image_url)
  end
end
