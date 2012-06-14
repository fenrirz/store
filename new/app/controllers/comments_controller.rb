class CommentsController < ApplicationController

 

  def create
    puts "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
    puts params.inspect
    @comment = Comment.new(params[:comment])
    #@article = Article.find_by_id(params[:comment][:article_id])
    #@comments = @article.comment
      
        respond_to do |format|
          if @comment.save
            format.html { redirect_to(article_path(article), :notice => 'Comment was successfully created.') }
            format.js
          end
        end
  end


end
