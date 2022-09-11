class Color < ApplicationRecord
  has_many :products, dependent: :destroy
  validates :rgb, presence: true
  validates :description, presence: true

  def rgb_with_description
    "颜色:#{rgb},描述:#{description}"
  end
end
