class ChangeMailingAddressToBilling < ActiveRecord::Migration
  def change
    rename_column :orders, :mailing_address, :billing_address  
  end
end
