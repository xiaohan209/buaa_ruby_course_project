class TransactionItem < ApplicationRecord
  belongs_to :user
  belongs_to :product
  belongs_to :transaction_order
end
