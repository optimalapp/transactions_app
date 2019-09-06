# frozen_string_literal: true

class User < ApplicationRecord
  require 'csv'
  scope :active, -> { where status: 'active' }
  has_many :transactions, dependent: :destroy
  validates :name, presence: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  def active?
    status == 'active'
  end

  def self.import_new_users(file)
    CSV.foreach(File.path(file), headers: true) do |row|
      row = row.to_hash
      user = User.find_by(name: row['name'], email: row['email'])
      User.create(row) if user.nil?
    end
  end
end
