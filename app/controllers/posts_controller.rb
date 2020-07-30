class PostsController < ApplicationController
  before_action :authenticate_user!
  layout "krish"
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    followings = Following.where(user_id: current_user.id).pluck('following')
    users = followings << current_user.id
    @posts = Post.where(user_id: users).order("created_at DESC")
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @user = User.find(@post.user_id)
  end

  # GET /posts/new
  def new
    @post = current_user.posts.build
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = current_user.posts.build(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def like
    @post = Post.find(params[:id])
    @post.liked_by current_user
    respond_to do |format|
      format.html { redirect_back fallback_location: root_path }
      format.js { render layout: false }
    end
  end

  def unlike
    @post = Post.find(params[:id])
    @post.unliked_by current_user
    respond_to do |format|
      format.html { redirect_back fallback_location: root_path }
      format.js { render layout: false }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:user_id, :caption, :image, :image_shot)
    end
end
