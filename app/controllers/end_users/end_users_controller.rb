class EndUsers::EndUsersController < ApplicationController
  before_action :logged_in_end_user, only: [:show, :edit, :update, :following, :followers, :withdraw]
  before_action :correct_current_end_user, only: [:edit, :update]
  before_action :quiz_is_available?, only: [:create]
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

  def withdraw
    end_user = EndUser.find(params[:id])
    if end_user == current_end_user
      end_user.update_attribute(:is_available, false)
      end_user.save
      log_out if logged_in?
      redirect_to root_path
    else
      redirect_back(fallback_location: root_path)
    end
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

    def quiz_is_available?
      quizes = Quiz.all
      if quizes.count < 8
        flash[:danger] = "現在クイズのメンテナンス中です。少々お待ちください"
        redirect_to new_end_user_path
      end
    end
end
