class Size < ApplicationRecord
  has_many :products, dependent: :destroy
  validates :size_name, presence: true
  validates :description, presence: true


  def size_with_description
    "尺寸:#{size_name},描述:#{description}"
  end
end
