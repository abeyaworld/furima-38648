class ItemsController < ApplicationController
  before_action :move_to_index, except: :index

  def index
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
  end

  private
  def move_to_index
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

  def item_params
    params.require(:item).permit(:item_name, :description, :price, :category_id, :condition_id, :shipping_fee_id, :item_prefecture_id, :shipping_date_id, :user, :image)
  end
end
