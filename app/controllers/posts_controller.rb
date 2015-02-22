class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :require_owner_authority, only: [:edit, :update, :delete]
  before_action :ensure_user_is_authorized, only: [:new, :create]

  # GET /posts
  # GET /posts.json
  def index
    if params[:category]
     @posts = Post.where(category: params[:category]).order("created_at DESC")
    else
     @posts = Post.all
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = @user.posts.create(post_params)
    redirect_to @post
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

  private
   # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :body, :category)
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    def require_owner_authority
      redirect_to root_path unless @post.user_id == current_user.id
    end

    def ensure_user_is_authorized
      @user = current_user
      unless @user.is_authorized
        redirect_to root_path, notice: "You are NOT authorized to post"
      else
        @user
      end
    end
end
