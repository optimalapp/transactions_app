class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :role, default: 'merchant'
      t.text :description
      t.string :email
      t.string :status, default: 'active'
      t.decimal :total_transaction_sum, precision: 15, scale: 2, default: 0
      t.index :email, unique: true

      t.timestamps
    end
  end
end
