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

  def self.import_new_users(_file)
    get_users_rows(_file) do |row|
      user = User.find_by(name: row['name'], email: row['email'])
      User.create(row) if user.nil?
    end
  end

  def self.get_users_rows(file)
    CSV.foreach(File.path(file), headers: true) do |row|
      yield row.to_hash
    end
  end
end
