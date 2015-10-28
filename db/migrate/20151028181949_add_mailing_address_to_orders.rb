class AddMailingAddressToOrders < ActiveRecord::Migration
  def change
   add_column :orders, :mailing_address, :text
   rename_column :orders, :address, :shipping_address  
  end
end
