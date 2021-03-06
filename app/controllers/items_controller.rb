class ItemsController < ApplicationController
  before_action :set_department
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  
  def index
    @items = @department.items 
  end

  def show
    @comments = Comment.where("item_id = #{@item.id}" )
  end

  def new
    @item = @department.items.new
    # form
  end

  def edit
    # form
  end

  def create
    @item = @department.items.create(item_params)
    if @item.save
      redirect_to [@department, @item]
    else
      render :form 
    end
  end

  def update
    if @item.update(item_params)
      redirect_to [@department, @item]
    else
      render :form
    end
  end

  def destroy
    @item.destroy
    redirect_to department_items_path
  end

  private

    def set_department
      @department = Department.find(params[:department_id])
    end

    def set_item
      @item = Item.find(params[:id])
    end

    def item_params
      params.require(:item).permit(:description, :name)
    end

  end