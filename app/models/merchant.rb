class Merchant < ApplicationRecord
  has_many :transactions, dependent: :destroy
end
