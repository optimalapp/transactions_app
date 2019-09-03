namespace :users do
  task import: :environment do
    file = Rails.root.join('lib','assets','users.csv')
    User.import_new_users(file)
  end
end
