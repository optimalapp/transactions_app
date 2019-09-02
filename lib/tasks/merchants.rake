namespace :merchants do
  task import: :environment do
    file = Rails.root.join('lib','assets','merchants.csv')
    Merchant.import_new_merchants(file)
  end
end
