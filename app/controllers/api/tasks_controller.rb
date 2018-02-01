module Api
  class TasksController < ApplicationController
    load_and_authorize_resource  
    
    def create  
      if @task.save
        render json: @task
      else
        render json: { error: @task.errors.full_messages }
      end
    end
    
    def update
      if change_priority && @task.update_attributes(task_params)
        render json: @task
      else
        render json: { error: @task.errors.full_messages }
      end
    end
    
    def destroy
      if @task.destroy
        render json: @task
      else
        render json: { error: @task.errors.full_messages }
      end
    end
    
    private

    def task_params
      params.require(:task).permit(:title, :project_id, :deadline, :done)
    end
    
    def change_priority
      new_priority = params[:task][:priority].to_i
      p new_priority 
      p @task.priority
      return true if new_priority == @task.priority
      @task.set_list_position(new_priority)
    end
  end
end