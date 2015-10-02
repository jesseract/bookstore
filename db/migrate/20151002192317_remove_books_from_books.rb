class RemoveBooksFromBooks < ActiveRecord::Migration
  def change
    remove_column :books, :books, :string
  end
end
