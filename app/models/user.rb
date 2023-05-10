class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :prototypes
  has_many :comments, dependent: :destroy
  # ここからバリデーションの設定を追加
  validates :email, presence: true
  validates :encrypted_password, presence: true
  validates :name, presence: true

  # 他のバリデーションの例
  # validates :email, uniqueness: true
  # validates :password, length: { minimum: 6 }
end
