class UsersController < ApplicationController
  before_action :set_user, only: [:posts, :admin, :remove_admin]
  before_action :authenticate_user!

  def index
  	@users = User.all
  end

  def posts
  	if @user
  		@posts = @user.posts.order('created_at DESC')
    end
  end

  def admin
    respond_to do |format|
      if @user.is_admin
        format.html { redirect_to users_path, notice: 'User ' + @user.email + ' is already admin.' }
      else
        @user.is_admin = true
        @user.save
        format.html { redirect_to users_path, notice: 'You just made ' + @user.email + ' admin.' }
      end
    end
  end

  def remove_admin
    respond_to do |format|
      if @user.is_admin
        @user.is_admin = false
        @user.save
        format.html { redirect_to users_path, notice: 'User ' + @user.email + ' is not admin anymore.' }
      else
        format.html { redirect_to users_path, notice: 'User ' + @user.email + ' already doesnt have admin rights.'}
      end
    end
  end

  private
  def set_user
    @user = User.find(params[:id])
  end
end
