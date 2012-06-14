class Admin::ArticlesController < Admin::ApplicationController
    #before_filter :require_admin_login, :only => [:show, :new, :create, :edit, :update, :destroy]
    #before_filter :find_article, :only => [:show, :edit, :update, :destroy]

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end
  
  def create
    @article = Article.new(params[:article])
    if @article.save
      flash[:notice] = 'Article was succsessfully create'
      redirect_to admin_articles_path
    else
      flash[:error] = 'Article unable to create'
      render new_admin_article_path
    end
  end
  
  def edit
    @article = Article.find_by_id(params[:id])
  end
  
  def update
    @article = Article.find_by_id(params[:id])
    if @article.update_attributes(params[:article])
      redirect_to admin_articles_path
    else
      flash[:error]= 'Article update failed'
      redirect_to edit_admin_article_path
    end
  end

  def destroy
    @article = Article.destroy(params[:id])
    redirect_to admin_articles_path
  end
  
  def show
    @article = Article.find_by_id(params[:id])
    @comment = @article.comments
    @comment = @article.comments.new
  end
end
