class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_num, :item_prefecture_id, :municipality, :house_num, :building, :phone_num, :purchase_record, :order_id, :token

  with_options presence: true do
    # orderモデルのバリデーション
    validates :user_id
    validates :item_id
    # paymentモデルのバリデーション
    validates :post_num, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: ' が不正です。ハイフン(-)を含めてください' }
    validates :item_prefecture_id, numericality: { other_than: 0, message: "を選択してください" }
    validates :municipality
    validates :house_num
    validates :phone_num, format: { with: /\A[0-9]{10,11}\z/, message: 'が不正です' }
    # トークンのバリデーション
     validates :token
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(post_num: post_num, item_prefecture_id: item_prefecture_id, municipality: municipality, house_num: house_num, building: building, phone_num: phone_num, order_id: order.id)
  end

end