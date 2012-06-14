class ArticlesController < ApplicationController
  before_filter :require_login, :only => [:new, :create, :edit, :update, :show]
  #before_filter :find_article
  #before_filter :your_article, :only =>[:new, :create, :edit, :update, :show, :delete]


  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(params[:article])
    @article.user_id = current_user.id
      if @article.save
        redirect_to articles_path
      else
        flash[:error]= 'Article invalid'
        render :action => "new"
      end
  end

  def edit
    @article = Article.find_by_id(params[:id])
  end

  def update
    @article = Article.find_by_id(params[:id])
    if  @article.update_attributes(params[:article])
      redirect_to articles_path
    else
      flash[:error] ='Article Can not been update'
      redirect_to edit_article_path
    end
  end

  def show
    @article = Article.find_by_id(params[:id])
    @comment = @article.comments.new
    @comments = @article.comments
  end


  def destroy
      Article.destroy(params[:id])
      redirect_to articles_path
  end

  private
    def find_article
      @article = Article.find_by_id(params[:id])
      if @article.nil?
        flash[:error] = "Article was not found"
        redirect_to articles_path
      end
    end
  

  def your_article
    user=User.find_by_email(current_user.email)
    unless @article.user_id == current_user || is_admin
       flash[:notice]="its not your article"
       redirect_to articles_path
      
    end
  end
end
