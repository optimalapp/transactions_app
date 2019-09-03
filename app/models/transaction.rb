class Transaction < ApplicationRecord
  belongs_to :user
  after_create :set_transaction_uuid
  after_create :set_user_transactions_sum

  private

  def set_transaction_uuid
    self.update!(uuid: SecureRandom.uuid)
  end

  def set_user_transactions_sum
    user_t_sum = self.user[:total_transaction_sum]
    total_sum = user_t_sum + self.amount
    self.user.update!(total_transaction_sum: total_sum)
  end
end
