module Api
  class CommentsController < ApplicationController
    load_and_authorize_resource  
   
    def create
      if @comment.save
        render json: @comment
      else
        render json: { error: @comment.errors.full_messages }, status: 422
      end  
    end
    
    def destroy
      if @comment.destroy
        render json: @comment
      else
        render json: { error: @comment.errors.full_messages }, status: 422
      end  
    end
    
    private
    
    def comment_params
      params.require(:comment).permit(:title, :task_id, :attachment)
    end
  end
end