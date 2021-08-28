class EndUsers::EndUsersController < ApplicationController
  before_action :logged_in_end_user, only: [:show, :edit, :update]
  before_action :correct_current_end_user, only: [:edit, :update]
  def new
    @end_user = EndUser.new
  end

  def create
    @end_user = EndUser.new(end_user_params)
    if @end_user.save
      log_in (@end_user)
      remember (@end_user)
      flash[:success] = "ユーザー登録に成功しました"
      redirect_to quizes_path
    else
      render 'new'
    end
  end

  def show
    @end_user = EndUser.find(params[:id])
  end

  def edit
    @end_user = EndUser.find(params[:id])
  end

  def update
    @end_user = EndUser.find(params[:id])
    @end_user.update!(end_user_params)
    redirect_to end_user_path(@end_user)
  end

  def following
    @end_user = EndUser.find(params[:id])
    @following_end_users = @end_user.following
  end

  def followers
    @end_user = EndUser.find(params[:id])
    @follower_end_users = @end_user.followers
  end

  private
    def end_user_params
      params.require(:end_user).permit(:name, :email, :profile, :image, :password, :password_confirmation)
    end

    def correct_current_end_user
      @end_user = EndUser.find(params[:id])
      unless @end_user.id == current_end_user.id
        redirect_back(fallback_location: root_path)
      end
    end
end
