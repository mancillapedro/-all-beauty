class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :orders, dependent: :destroy
  validates :name, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true, format: { with: /^(\+?56)?(\s?)(0?9)(\s?)[9876543]\d{7}$/, multiline: true}

  def carro
    attributes = { user: self, status: false }
    Order.where(attributes).first || Order.create(attributes)
  end
end
