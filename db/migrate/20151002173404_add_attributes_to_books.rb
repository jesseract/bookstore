class AddAttributesToBooks < ActiveRecord::Migration
  def change
    add_column :books, :books, :string
    add_column :books, :title, :string
    add_column :books, :published_date, :date
    add_column :books, :author, :string
    add_column :books, :price_cents, :integer
    add_column :books, :category, :string
  end
end
