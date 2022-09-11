class TransactionOrder < ApplicationRecord
  belongs_to :user
  has_many :transaction_items
  validates :delivery_address, presence: true
  validates :delivery_name, presence: true

  validates_each :delivery_phone do |model, attr, value|
    pattern = /^1[3456789]\d{9}$/
    if value == nil
      model.errors.add(attr,"手机号不能为空")
    elsif not pattern === value
      model.errors.add(attr,"请填写正确的手机号")
    end
  end

  validates_each :delivery_postcode do |model, attr, value|
    pattern = /^[1-9]\d{5}$/
    if value == nil
      model.errors.add(attr,"邮编不能为空")
    elsif not pattern === value
      model.errors.add(attr,"请填写正确的邮编")
    end
  end

end
