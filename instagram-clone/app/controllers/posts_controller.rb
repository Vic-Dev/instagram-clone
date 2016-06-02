class PostsController < ApplicationController
  def index
    @posts = Post.order(id: :desc)
    respond_to do |format|
      format.json { render json: @posts.to_json }
      format.html {}
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      render json: @post.to_json, status: :created
    end
  end

  protected

  def post_params
    params.require(:post).permit(
      :title, :description
    )
  end
end
