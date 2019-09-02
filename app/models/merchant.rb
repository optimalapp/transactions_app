class Merchant < ApplicationRecord
  require 'csv'
  has_many :transactions, dependent: :destroy

  private

  def self.import_new_merchants(file)
    CSV.foreach(File.path(file), headers: true) do |row|
      row = row.to_hash
      merchant = Merchant.find_by(name: row['name'], email: row['email'])
      merchant.nil? ? Merchant.create(row) : nil
    end
  end
end
