class Admin::UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to admin_users_url, notice: "ユーザー「#{@user.name}を新規作成しました。」"
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.update
  end

  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.all.order(id: "DESC")
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_cofirmation)
    end
end
