class AddPathToArticles < ActiveRecord::Migration[7.1]
  def change
    add_column :articles, :path, :string
  end
end
