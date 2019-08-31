class Transaction < ApplicationRecord
  belongs_to :merchant
  after_create :set_transaction_uuid

  private

  def set_transaction_uuid
    self.uuid = SecureRandom.uuid
  end
end
