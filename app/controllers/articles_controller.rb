# The articles' files are located at `./_articles` folder.
class ArticlesController < ApplicationController
  include Utils

  def index
    @articles = Article.all.order(:id)
  end

  def show
    @article = Article.find_by!(path: params[:path])
    @content = read_file(
      "_articles/#{@article.id}_#{@article.path}.md"
    )
    @markdown = Redcarpet::Markdown.new(
      Redcarpet::Render::HTML,
      autolink: true,
      space_after_headers: true
    )
  end
end
