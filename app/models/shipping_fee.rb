class ShippingFee < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: 'TEST' }
  ]

  include ActiveHash::Associations
  has_many :items
end