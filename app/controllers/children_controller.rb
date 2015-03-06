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
    @child = Child.new
    respond_with(@child)
  end

  def edit
  end

  def create
    @child = Child.new(child_params)
    @child.save
    respond_with(@child)
  end

  def update
    @child.update(child_params)
    respond_with(@child)
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
      params.require(:child).permit(:first_name, :last_name, :parent_id, :age, :allergies)
    end
end
