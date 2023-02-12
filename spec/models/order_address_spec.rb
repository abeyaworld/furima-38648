require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
  end

  describe '商品購入' do
    context '購入完了' do
      it '正しい記入' do
        expect(@order_address).to be_valid
      end
      it '建物名が空欄' do
        @order_address.building = ''
        be_valid
      end
    end
    context '購入NG' do
      it '郵便番号が空欄では購入できない' do
        @order_address.post_num = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post num can't be blank")
      end
      it '郵便番号は、「3桁ハイフン4桁」の半角文字列のみ保存可能' do
        @order_address.post_num = 1_111_111
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Post num  が不正です。ハイフン(-)を含めてください')
      end
      it '都道府県が未選択では登録できない' do
        @order_address.item_prefecture_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Item prefecture を選択してください')
      end
      it '市区町村が必須' do
        @order_address.municipality = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Municipality can't be blank")
      end
      it '番地が必須' do
        @order_address.house_num = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("House num can't be blank")
      end
      it '市区町村が必須' do
        @order_address.municipality = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Municipality can't be blank")
      end
      it '電話番号が必須' do
        @order_address.phone_num = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone num can't be blank")
      end
      it '電話番号は、10桁以上11桁以内の半角数値のみ保存可能' do
        @order_address.phone_num = '000-0000-0000'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone num が不正です')
      end
      it 'トークンが必須' do
        @order_address.token = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'userが紐付いていなければ出品できない' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていなければ出品できない' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
