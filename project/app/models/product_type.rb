class ProductType < ApplicationRecord
  has_many :products, dependent: :destroy
  validates :product_type_name, presence: true

  def product_type_with_description
    "#{product_type_name}"
  end
end
