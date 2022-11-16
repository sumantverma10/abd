class PostsController < ApplicationController
  http_basic_authenticate_with name: "hye", password: "secret", only: :destroy
  def index
    @posts=Post.all
  end

  def new
    @post=Post.new
  end

  def edit
    @post=Post.find(params[:id])
  end

  def update
    @post=Post.find(params[:id])
    if @post.update(params_fun)
      redirect_to posts_path
    else
      render :edit
    end
  end

  def show
    @post=Post.find(params[:id])
  end

  def create
    @post=Post.new(params_fun)
    if @post.save
      redirect_to posts_path
    else 
      render :new
    end
  end

  def destroy
    @post=Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  private
  def params_fun
    params.require(:post).permit(:name)
  end
end
