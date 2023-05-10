class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :prototypes
  has_many :comments, dependent: :destroy
  # ここからバリデーションの設定を追加
  validates :username, presence: true
  validates :email, presence: true
  validates :encrypted_password, presence: true
  validates :username, presence: true
  # 必要に応じて、他のカラムにもバリデーションを追加してください

  # 他のバリデーションの例
  # validates :email, uniqueness: true
  # validates :password, length: { minimum: 6 }
end
