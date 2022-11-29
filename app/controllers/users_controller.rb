class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @latest_three_posts = @user.latest_three
  end
end
