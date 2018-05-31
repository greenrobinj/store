class CommentsController < ApplicationController


  before_action :set_item
  
    def new
      @comment = @item.comments.new
    end
  
    def create
      @comment = @item.comments.new(comment_params)
      if @comment.save
        redirect_to department_item_path(@item.department_id, @item)
      else
        render :new
      end
    end
  
    private
      def set_item
        @item = Item.find(params[:format])
      end
  
      def comment_params
        params.require(:comment).permit(:description, :ratitn)
      end
end
