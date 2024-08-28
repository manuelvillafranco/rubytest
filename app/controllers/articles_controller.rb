class ArticlesController < ApplicationController

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render :new
    end
  end

  def index
    @recent_articles = Article.recent
    @articles = Article.includes(:comments).all
  end

  private

  def article_params
    params.require(:article).permit(:title, :body)
  end
end
