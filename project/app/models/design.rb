class Design < ApplicationRecord
  validates :design_name, presence: true
  has_many :products, dependent: :destroy
end
