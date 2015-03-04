class UsersController < ApplicationController
  before_filter :authenticate_user!, :except => [:show, :index]
    before_filter :set_user, :only => [:edit, :update, :show]

    def edit
      @user = current_user
    end

    def show
    end

    def index
    end

    def update
      @user = User.find(params[:id])
      respond_to do |format|
        if @user.update_attributes(params[:user])
          format.html { redirect_to :back, notice: 'User was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @event.errors, status: :unprocessable_entity }
        end
      end
    end

    private

    def set_user
      @user = User.find(params[:id])
    end

end
