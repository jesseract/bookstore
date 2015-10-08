class ChangePriceToMonetizeInBooks < ActiveRecord::Migration
  def change
    remove_column :books, :price_cents
    add_monetize :books, :price, currency: { present: false }
  end
end
