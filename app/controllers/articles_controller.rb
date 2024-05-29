# The articles' files are located at `./_articles` folder.
class ArticlesController < ApplicationController
  include Utils

  def index
    @articles = Rails.configuration.articles
  end

  def show
    @articles = Rails.configuration.articles

    @articles.each do |article|
      if article.path == params[:path]
        @article = article
        break
      end
    end

    @content = read_file(
      "_articles/#{@article.id}_#{@article.path}_#{@article.title}.md"
    )

    @markdown = Redcarpet::Markdown.new(
      Redcarpet::Render::HTML,
      autolink: true,
      space_after_headers: true
    )
  end
end
