class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_fee
  belongs_to :item_prefecture
  belongs_to :shipping_date
  validates :category_id, numericality: { other_than: 1}
  validates :condition_id, numericality: { other_than: 1}
  validates :shipping_fee_id, numericality: { other_than: 1}
  validates :item_prefecture_id, numericality: { other_than: 1}
  validates :shipping_date_id, numericality: { other_than: 1}

  has_one_attached :image

  belongs_to :user

  validates :item_name, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :image, presence: true

end
