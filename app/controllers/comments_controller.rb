class CommentsController < ApplicationController
  def create
    @comment = Comment.create(comment_params)
    if @comment.save
      redirect_to prototype_path(@comment.prototype)
    else
      @prototype = @comment.prototype
      render "prototypes/show"
    end
  end

  private
  def comment_params
      params.require(:comment).permit(:text).merge(prototype_id: params[:prototype_id], user_id: current_user.id)
    end

end