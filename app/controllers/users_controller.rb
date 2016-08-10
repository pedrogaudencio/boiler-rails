class UsersController < ApplicationController
  before_action :set_user, only: [:show, :me, :edit]
  load_and_authorize_resource

  def show
  end

  def me
  end

  def edit
  end

  def set_user
    @user = User.find(params[:id])
  end

  def update
    if current_user.update_attributes(user_params)
      redirect_to user_path(current_user)
    else
      render :edit
      flash.now[:danger] = 'Something went wrong.'
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :image, :role, :id)
    end
end
