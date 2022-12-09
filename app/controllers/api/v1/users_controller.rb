class Api::V1::UsersController < Api::V1::ApplicationController
  def index
    @users = User.all
    render json: @users, status: :ok
  end

  def show
    @user = User.find(params[:id])
    @latest_three_posts = @user.latest_three
    render json: @latest_three_posts, status: :ok
  end

  def api_token
    @user = User.find(params[:id])
    respond_to do |format|
      format.json { render :json => @user.api_token, status: :ok }
    end
  end
end