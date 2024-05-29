# Article
class Article
  attr_accessor :id, :path, :title

  def initialize(id, path, title)
    self.id = id
    self.path = path
    self.title = title
  end
end

articles = []

Dir['_articles/*.md'].each do |file_path|
  article_props = file_path.sub('_articles/', '').sub('.md', '').split('_')
  id = article_props[0]
  path = article_props[1]
  title = article_props[2]
  articles << Article.new(id, path, title)
end

Rails.application.config.articles = articles
