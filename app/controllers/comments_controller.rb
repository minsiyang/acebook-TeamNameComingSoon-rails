class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    @comment.save
    flash[:msg] = 'Your post was successful!'
    redirect_to posts_path(@post)
  end

  private
  def comment_params
    params.require(:comment).permit(:content)
  end
end
