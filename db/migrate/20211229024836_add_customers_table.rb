class AddCustomersTable < ActiveRecord::Migration[6.0]
  def change
    create_table :customers do |t|
      t.string :fee_type
      t.integer :fee
      t.integer :tenants
      t.integer :amount_per_tenant

      t.timestamps
    end
  end
end
