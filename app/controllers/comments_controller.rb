class CommentsController < ApplicationController


  before_action :set_item
  
    def new
      binding.pry
      @comment = @item.comments.new
    end
  
    def create
      @comment = @item.comments.new(comment_params)
      if @comment.save
        redirect_to departmetnt_item_path(@item.department_id, @item)
      else
        render :new
      end
    end
  
    private
      def set_item
        binding.pry
        @item = Item.find(params[:item_id])
      end
  
      def comment_params
        params.require(:comment).permit(:description, :rating)
      end
end
