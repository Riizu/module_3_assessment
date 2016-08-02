class Api::V1::ItemsController < ApiBaseController
  def index
    render json: Item.all
  end

  def show

  end

  def create

  end

  def destroy

  end
end
