class PostsController < ApplicationController
  def index
    @posts = Post.all
    respond_to do |format|
      format.json { render json: @posts.to_json }
      format.html {}
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new (post_params)

    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  def update
    @post = Post.find(params[:id])

    if @post.update_attributes(post_params)
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  protected

  def post_params
    params.require(:post).permit(
      :title, :description
    )
  end
end
