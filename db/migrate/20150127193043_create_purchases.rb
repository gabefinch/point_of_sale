class CreatePurchases < ActiveRecord::Migration
  def change
    create_table(:purchases) do |t|
      t.column(:customer_name, :string)
      t.timestamps
    end
  end
end
