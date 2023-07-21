class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]

  # GET /users or /users.json
  def index
    @users = User.all
  end

  # GET /users/1 or /users/1.json
  def show
  end

  def edit
    @user = User.find(params[:id])
    unless current_user == @user
      redirect_to users_path, alert: "You can only edit your own profile"
    end
  end
  
  def update
    @user = User.find(params[:id])
    if current_user == @user
      if @user.update(user_params)
        redirect_to @user, notice: 'User was successfully updated.'
      else
        render :edit
      end
    else
      redirect_to users_path, alert: "You can only update your own profile"
    end
  end
  
  def destroy
    @user = User.find(params[:id])
    if current_user == @user
      @user.destroy
      redirect_to users_url, notice: 'User was successfully destroyed.' 
    else
      redirect_to users_path, alert: "You can only delete your own profile"
    end
  end
  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:email, :profile_picture, :username)
    end
end
