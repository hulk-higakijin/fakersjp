class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]

  # GET /posts
  def index
    @posts = Post.eager_load(:user).reverse
    @post = Post.new
  end

  # GET /posts/1
  def show; end

  # GET /posts/1/edit
  def edit; end

  # POST /posts
  def create
    # binding.pry
    @post = current_user.posts.new(post_params)
    @new_post = Post.new

    unless @post.save
      @posts = Post.eager_load(:user).reverse
      render :index, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /posts/1
  def update
    if @post.update(post_params)
      redirect_to @post, notice: 'Post was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /posts/1
  def destroy
    @post.destroy
    redirect_to posts_url, notice: 'Post was successfully destroyed.'
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:content, :user_id, :post_likes_count, :reposts_count, :comments_count)
    end
end
