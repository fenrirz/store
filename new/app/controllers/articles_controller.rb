class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(params[:article])
      if @article.save
        redirect_to articles_path
      else
        flash[:error]= 'Article invalid'
        render :action => "new"
      end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if  @article.update_attributes(params[:article])
      redirect_to articles_path
    else
      flash[:error] ='Article Can not been update'
      redirect_to edit_article_path
    end
  end

  def show
    @article = Article.find(params[:id])
    @comment = @article.comments.new
    @comments = @article.comments
  end


  def destroy
    Article.destroy(params[:id])
    redirect_to articles_path
  end
end
