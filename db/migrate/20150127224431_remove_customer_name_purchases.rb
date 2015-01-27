class RemoveCustomerNamePurchases < ActiveRecord::Migration
  def change
    remove_column(:purchases, :customer_name, :string)
  end
end
