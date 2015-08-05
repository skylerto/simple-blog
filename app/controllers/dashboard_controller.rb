class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    redirect_to dashboard_posts_path
  end

  def settings
    @user = current_user
  end

  def user_edit
    @user = current_user
  end

  def show
  end

  def comments
    @comments = Comment.all.order('created_at DESC')
  end

  def posts
    @posts = Post.all.order('created_at DESC')
  end

  def users
    @users = User.all.order('email DESC')
  end

  def promote
    @user = User.find(params[:id])

    if @user.admin?
      @user.admin = false
    else
      @user.admin = true
    end

    if @user.save
      redirect_to dashboard_users_path
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to dashboard_users_path
  end
end
