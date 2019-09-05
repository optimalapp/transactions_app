# frozen_string_literal: true

User.all.each do |user|
  number_of = rand(7..30)
  number_of.times do
    user.transactions.create(amount: rand(70..300))
  end
end
