class PostsController < ApplicationController
  before_action :set_post, only: [:edit, :update, :destroy]
  before_filter :authenticate_user!, except: [:create]


  # GET /posts/1/edit
  def edit
    session[:return_to] = request.referer
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    @discussion = Discussion.find(@post.discussion_id)
    respond_to do |format|
      if @post.save
        format.html { redirect_to :back, flash: {success: 'Post was successfully created.' }}
        format.json { render action: 'show', status: :created, location: @post }
      else
        format.html { redirect_to :back, alert: "Post could not be created." }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update

    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to session[:return_to], notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:discussion_id, :name, :comment, :image,
                                       :no_bump)
    end
end
