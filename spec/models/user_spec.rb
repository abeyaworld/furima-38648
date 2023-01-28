require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる' do
      it '全ての項目が存在すれば登録できる' do
      end
    end
    context '新規登録できない' do
      it 'nicknameが空では登録できない' do
      end
      it 'emailが空では登録できない' do
      end
      it '同じemailがあったら登録できない' do
      end
      it 'emailに@がないと登録できない' do
      end
      it 'passwordが空では登録できない' do
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
      end
      it 'passwordが5文字以下では登録できない' do
      end
      it 'passwordが数字だけでは登録できない' do
      end
      it 'passwordが文字だけでは登録できない' do
      end
      it 'passwordが全角では登録できない' do
      end
      it 'family_nameが空では登録できない' do
      end
      it 'first_nameが空では登録できない' do
      end
      it 'family_nameが全角でないと登録できない' do
      end
      it 'first_nameが全角でないと登録できない' do
      end
      it 'family_name_kanaが空では登録できない' do
      end
      it 'first_name_kanaが空では登録できない' do
      end
      it 'family_name_kanaがカタカナでないと登録できない' do
      end
      it 'first_name_kanaがカタカナでないと登録できない' do
      end
      it 'birthdayが空では登録できない' do
      end
    end
  end
end
