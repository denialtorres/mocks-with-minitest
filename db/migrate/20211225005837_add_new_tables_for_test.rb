class AddNewTablesForTest < ActiveRecord::Migration[6.0]
  def change
    create_table :accounts do |t|
      t.integer :balance
      t.integer :user_id

      t.timestamps
    end

    create_table :transactions do |t|
      t.integer :amount
      t.integer :initial_balance
      t.integer :final_balance
      t.integer :sender_id
      t.integer :receiver_id
      t.integer :account_id
      t.string :status, default: 'pending'

      t.timestamps
    end
  end
end
