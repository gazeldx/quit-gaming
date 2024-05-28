# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

Dir['_articles/*.md'].each do |file_path|
  id_path = file_path.sub('_articles/', '').sub('.md', '').split('_')
  Article.find_or_create_by!(id: id_path[0]) do |article|
    article.path = id_path[1]
  end
end
