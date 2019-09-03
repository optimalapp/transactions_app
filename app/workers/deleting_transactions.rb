class DeletingTransactions
  include Sidekiq::Worker

  def perform
    Transaction.delete_older_than(60) #minutes
  end
end
