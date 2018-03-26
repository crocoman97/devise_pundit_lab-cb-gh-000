class UsersController < ApplicationController

  before_action :find_user, only: [:update, :show, :destroy]

  def index
    @users = User.all
  end

  def show
    authorize @user
  end

  def update
    authorize(@user)
    if @user.update(params[:user])
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def destroy
    authorize(@user)
    @user.destroy
    redirect_to users_path
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

end
