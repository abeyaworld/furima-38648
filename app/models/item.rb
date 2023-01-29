class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_fee
  belongs_to :item_prefecture
  belongs_to :shipping_date
  has_one_attached :image

  belongs_to :user
end
