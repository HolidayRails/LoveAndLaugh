class UsersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :set_user, :only => [:edit, :update, :show]

    def edit
    end

    def show
    end

    def index
      @users = User.all
    end

    def update
      @user = User.find(params[:id])
      respond_to do |format|
        if @user.update_attributes(user_params)
          format.html { redirect_to users_path, notice: 'User was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: 'edit' }
          format.json { render json: @event.errors, status: :unprocessable_entity }
        end
      end
    end

    private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:email, :name, :confirmed)
    end
end
