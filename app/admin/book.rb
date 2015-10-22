ActiveAdmin.register Book do
  permit_params :title, :published_date, :author, :price_cents, :category

  action_item :create, only: :index do
      link_to "Add a Book" , "/admin/books/new"
  end
end
