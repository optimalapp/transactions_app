class User < ApplicationRecord
  require 'csv'
  has_many :transactions, dependent: :destroy
  validates :name, presence: true
  validates :email, presence: true

  private

  def self.import_new_users(file)
    CSV.foreach(File.path(file), headers: true) do |row|
      row = row.to_hash
      user = User.find_by(name: row['name'], email: row['email'])
      user.nil? ? User.create(row) : nil
    end
  end
end
