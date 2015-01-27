class CreateProductsPurchases < ActiveRecord::Migration
  def change
    create_table(:products_purchases, id:false) do |t|
      t.belongs_to(:product, index: true)
      t.belongs_to(:purchase, index: true)
      t.timestamps null: false
    end
  end
end
