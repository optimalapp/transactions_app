class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.integer :amount
      t.string :status
      t.integer :merchant_id
      t.uuid :uuid
      t.index :uuid

      t.timestamps
    end
  end
end
