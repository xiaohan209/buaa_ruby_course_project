class Product < ApplicationRecord
  belongs_to :design
  belongs_to :color
  belongs_to :size
  belongs_to :product_type
  has_many :cart_items,dependent: :delete_all
  has_many :transaction_items,dependent: :destroy
  validates :product_name, presence: true

  validates_each :retail_price do |model, attr, value|
    if value == nil
      model.errors.add(attr,"can't be empty")
    elsif value == 0
      model.errors.add(attr,": just can be decimal(10,2) and not zero")
    elsif value < 0
      model.errors.add(attr,": just can be more than zero")
    end
  end

  def url_all
    Rails.root.join(image_directory)
  end
end