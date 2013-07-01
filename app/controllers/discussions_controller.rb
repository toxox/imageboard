class DiscussionsController < ApplicationController
  before_action :set_discussion, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, except: [:index, :show, :create]

  # GET /discussions
  # GET /discussions.json
  def index
    @board = Board.find(params[:board_id])
    @existing_discussions = Discussion.all
    @discussion = Discussion.new
  end

  # GET /discussions/1
  # GET /discussions/1.json
  def show
    @board = Board.find(params[:board_id])
    @post = Post.new
  end

  # GET /discussions/new
  def new
    @board = Board.find(params[:board_id])
    @discussion = Discussion.new
  end

  # GET /discussions/1/edit
  def edit
    @board = Board.find(params[:board_id])
  end

  # POST /discussions
  # POST /discussions.json
  def create
    @board = Board.find(params[:board_id])
    @discussion = Discussion.new(discussion_params)

    respond_to do |format|
      if @discussion.save
        format.html { redirect_to board_discussion_path(@board, @discussion), notice: 'Discussion was successfully created.' }
        format.json { render action: 'show', status: :created, location: @discussion }
      else
        format.html { render action: 'new', notice: @discussion.errors }
        format.json { render json: @discussion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /discussions/1
  # PATCH/PUT /discussions/1.json
  def update
    @board = Board.find(params[:board_id])
    respond_to do |format|
      if @discussion.update(discussion_params)
        format.html { redirect_to board_discussion_path(@board, @discussion), notice: 'Discussion was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @discussion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /discussions/1
  # DELETE /discussions/1.json
  def destroy
    @board = Board.find(params[:board_id])
    @discussion.destroy
    respond_to do |format|
      format.html { redirect_to @board }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_discussion
      @discussion = Discussion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def discussion_params
      params.require(:discussion).permit(:name, :subject, :comment, :board_id)
    end
end
