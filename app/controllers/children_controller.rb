class ChildrenController < ApplicationController
  before_action :set_child, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @children = Child.all
    respond_with(@children)
  end

  def show
    respond_with(@child)
  end

  def new
    @user = current_user
    @child = @user.children.build
    respond_with(@child)
  end

  def edit
  end

  def create
    @user = current_user
    @child = @user.children.build(child_params)
    @child.update_attribute(:parent_id, @user.id)
    @child.save
    respond_with(@child)
  end

  def update
    @child.update(child_params)
    respond_to do |format|
      if @child.update_attributes(child_params)
        format.html { redirect_to children_path, notice: 'Child was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @child.destroy
    respond_with(@child)
  end

  private
    def set_child
      @child = Child.find(params[:id])
    end

    def child_params
      if params.count > 1
        params.require(:child).permit(:first_name, :user_id, :last_name, :age, :allergies)
      end
    end


end
