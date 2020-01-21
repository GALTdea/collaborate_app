class DailyPostsController < ApplicationController
  protect_from_forgery unless: -> { request.format.json? }
  before_action :set_daily_post, only: [:show, :edit, :update, :destroy]

  # GET /daily_posts
  # GET /daily_posts.json
  def index
    @daily_posts = DailyPost.all
  end

  # GET /daily_posts/1
  # GET /daily_posts/1.json
  def show
  end

  # GET /daily_posts/new
  def new
    @daily_post = DailyPost.new
     @challenge =  Challenge.last
  end

  # GET /daily_posts/1/edit
  def edit
  end

  # POST /daily_posts
  # POST /daily_posts.json
  def create
    @daily_post = current_user.daily_posts.new(daily_post_params)
     # @daily_post.user_id =  current_user
     # @challenge = current_user.challenges.new(challenge_params)
    respond_to do |format|
      if @daily_post.save
        format.html { redirect_to @daily_post, notice: 'Daily post was successfully created.' }
        format.json { render :show, status: :created, location: @daily_post }
      else
        format.html { render :new }
        format.json { render json: @daily_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /daily_posts/1
  # PATCH/PUT /daily_posts/1.json
  def update
    respond_to do |format|
      if @daily_post.update(daily_post_params)
        format.html { redirect_to @daily_post, notice: 'Daily post was successfully updated.' }
        format.json { render :show, status: :ok, location: @daily_post }
      else
        format.html { render :edit }
        format.json { render json: @daily_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /daily_posts/1
  # DELETE /daily_posts/1.json
  def destroy
    @daily_post.destroy
    respond_to do |format|
      format.html { redirect_to daily_posts_url, notice: 'Daily post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_daily_post
      @daily_post = DailyPost.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def daily_post_params
      params.require(:daily_post).permit(:title, :completed, :user_id , entries_attributes: [:id, :title, :entry_id, :daily_post_id, :user_id ])
    end
end
