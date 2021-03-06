class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to @post, notice: "投稿成功"
    else
      render :new
    end
  end

  def update
    if @post = Post.update(post_params)
      redirect_to @post, notice: "編集成功"
    else
      render :edot
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_url, notice: "削除成功"
  end

  def edit
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:content)
    end

end
