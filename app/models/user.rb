class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i
  validates :password, format: { with: VALID_PASSWORD_REGEX, message: '半角英数を両方含む必要があります' }


  VALID_NAME_REGEX = /\A[ぁ-んァ-ン一-龥々]+\z/
  validates :family_name, presence: true, format: { with: VALID_NAME_REGEX, message: '全角である必要があります' }
  validates :first_name, presence: true, format: { with: VALID_NAME_REGEX, message: '全角である必要があります' }

  VALID_NAME_KANA_REGEX = /\A[ァ-ヶー－]+\z/
  validates :family_name_kana, presence: true, format: { with: VALID_NAME_KANA_REGEX, message: '全角カタカナである必要があります' }
  validates :first_name_kana, presence: true, format: { with: VALID_NAME_KANA_REGEX, message: '全角カタカナである必要があります' }

  validates :birthday, presence: true


end
