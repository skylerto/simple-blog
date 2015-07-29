class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    puts params_permit
    @comment = @post.comments.create(params_permit)

    redirect_to post_path(@post)
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy

    redirect_to post_path(@post)
  end

  private
  def params_permit
    params[:comment].permit(:name, :body)
  end
end
