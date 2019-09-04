class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.decimal :amount, precision: 15, scale: 2
      t.string :status, default: 'processed'
      t.integer :user_id
      t.uuid :uuid
      t.index :uuid

      t.timestamps
    end
  end
end
