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
      flash[:error] = 'asdasdasd'
      redirect_to :action => :index
    end
  end

  def edit
    @article = Article.find(params[:id])     
  end

  def update
    @article = Article.find(params[:id])
      if @article.update_attributes(params[:article])
        redirect_to :action => :index
      else
        render :edit
      end
  end

  def destroy
    Article.destroy(params[:id])
    redirect_to articles_path 
  end
 
  def show
    @article = Article.find(params[:id]) 
    @comment = Comment.new
    @comments = @article.comments    
  end

end
