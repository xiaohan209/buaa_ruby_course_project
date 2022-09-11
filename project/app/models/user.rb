class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :cart_items, dependent: :delete_all
  has_many :transaction_items,dependent: :destroy
  has_many :transaction_orders, dependent: :delete_all
  has_many :favorites, dependent: :delete_all

  validates_each :phone do |model, attr, value|
    pattern = /^1[3456789]\d{9}$/
    puts(value)
    puts("phone number")
    if value == nil
      model.errors.add(attr,"手机号不能为空")
    elsif not pattern === value
      model.errors.add(attr,"请填写正确的手机号")
    end
  end
end
