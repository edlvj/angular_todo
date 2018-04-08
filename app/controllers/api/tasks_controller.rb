module Api
  class TasksController < ApplicationController
    load_and_authorize_resource  
    
    def create  
      if @task.save
        render json: @task
      else
        render json: { error: @task.errors.full_messages }, status: 422
      end
    end
    
    def update
      if change_priority && @task.update_attributes(task_params)
        render json: @task
      else
        render json: { error: @task.errors.full_messages }, status: 422
      end
    end
    
    def destroy
      if @task.destroy
        render json: @task
      else
        render json: { error: @task.errors.full_messages }, status: 422
      end
    end

    private

    def task_params
      params.require(:task).permit(:title, :project_id, :deadline, :done)
    end
    
    def change_priority
      return true unless params[:task][:move_type]
      
      case params[:task][:move_type].to_sym
      when :up
        @task.increment_position
      when :down
        @task.decrement_position
      else
        true
      end
    end
  end
end