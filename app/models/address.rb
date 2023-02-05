class Address < ApplicationRecord
  belongs_to :order
  validates :post_num, presence: true
  validates :item_prefecture_id, numericality: { other_than: 1 }
  validates :municipality, presence: true
  validates :house_num, presence: true
  # buildingはバリデーションなし
  validates :phone_num, presence: true

  validates :item_name, presence: true
  validates :description, presence: true
end
