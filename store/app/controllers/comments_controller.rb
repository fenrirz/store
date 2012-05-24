class CommentsController < ApplicationController

  def create
    @comment = Comment.new(params[:comment])
    respond_to do|format|
      if @comment.save
      format.html { redirect_to(article_path(article), :notice => 'Comment was successfully created.') }
      format.js
      else
      flash[:error] = ''
      redirect_to :action => :index
      end
    end
  end

end
