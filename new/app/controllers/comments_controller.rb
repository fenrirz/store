class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(params[:id])
      if @comment.save
        redirect_to articles_path
      else
        redirect_to article_path
      end
  end


end
