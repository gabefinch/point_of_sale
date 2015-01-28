class Purchase < ActiveRecord::Base
  has_and_belongs_to_many(:products)

  scope(:between, lambda do |date_begin, date_end|
    where("created_at >= :date_begin AND created_at <= :date_end",
    { :date_begin => date_begin, :date_end => date_end })
  end)

  # define_singleton_method(:in_date_range) do |date_start, date_end|
  #   returned_purchases = []
  #   Purchase.all().each do |purchase|
  #     if purchase.created_at() > date_start & purchase.created_at() < date_end
  #       returned_purchases.push(purchase)
  #     end
  #   end
  #   returned_purchases
  # end

  define_method(:total) do
    total = 0
    self.products.each() do |product|
      total = product.price + total
    end
    total
  end

end
