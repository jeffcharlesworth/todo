class Api::ItemsController < ApiController
  before_action :authenticated?

  def index
  end

  def create
    item = Item.new(item_params)
    item.list_id = params[:list_id]

    if item.save
      render json: item
    else
      render json: { errors: item.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :description)
  end
end
