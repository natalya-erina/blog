class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  
  def index
    @posts = Post.all.order('created_at DESC')
  end

  def new
    @post = current_user.posts.build
  end

  def create
  	@post = current_user.posts.build(post_params)
  	
    respond_to do |format|
      if @post.save
    	  format.html {redirect_to @post, notice: 'Post was successfully created'}
        format.json {render :show, status: :created, location: @post}
      else
        format.html {render :new}
        format.json {render json: @post.errors, status: :unprocessable_entity}
      end
    end
  end

  def show
  end

  def edit
  end

  def update
    if @post.update(params[:post].permit(:title,:body))
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end

  private
    def post_params
      params.require(:post).permit(:title,:body)
    end

    def set_post
      @post = Post.find(params[:id])
    end
end
