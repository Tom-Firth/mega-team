class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
    @article = Article.find(params[:id])
    if @article.body.downcase.include?("<script")
      @ninja = true
    else
      @body_markdown = markdown.render(@article.body)
    end
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(params_article)
    @article.user = current_user
    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    
    if @article.update(params_article)
      redirect_to @article
    else
      render 'new'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end

  private 

  def params_article
    params.require(:article).permit(:title, :body)
  end
end
