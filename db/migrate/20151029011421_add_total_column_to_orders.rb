class AddTotalColumnToOrders < ActiveRecord::Migration
  def change
   add_column :orders, :total, :integer, default: 0, null: false
  end
end
