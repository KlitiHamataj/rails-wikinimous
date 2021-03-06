class ArticlesController < ApplicationController
  before_action :find_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.all.order('created_at DESC')
  end

  def show; end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.save
    redirect_to articles_path(@article), notice: 'Article created'
  end

  def edit; end

  def update
    @article.update(article_params)
    redirect_to articles_path(@article), notice: 'Article updated'
  end

  def destroy
    @article.destroy
    redirect_to articles_path(@article), notice: 'Article deleted'
  end

  private

  def find_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :content)
  end
end
