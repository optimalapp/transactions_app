class CreateMerchants < ActiveRecord::Migration[6.0]
  def change
    create_table :merchants do |t|
      t.string :name
      t.text :description
      t.string :email
      t.string :status
      t.integer :total_transaction_sum
      t.index :email, unique: true

      t.timestamps
    end
  end
end
