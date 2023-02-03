class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  before_action :item_set, except: [:index, :new, :create]

  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
    return unless @item.user != current_user

    redirect_to root_path
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  private

  def move_to_index
    return if user_signed_in?

    redirect_to new_user_session_path
  end

  def item_params
    params.require(:item).permit(:item_name, :description, :price, :category_id, :condition_id, :shipping_fee_id,
                                 :item_prefecture_id, :shipping_date_id, :image).merge(user_id: current_user.id)
  end

  def item_set
    @item = Item.find(params[:id])
  end
end
