class TasksController < ApplicationController
    before_action :load_task, except: [:index, :new, :create]
    
    def index
        @tasks = Task.all
    end

    def new
        @task = Task.new
    end
    
    def create
        @task = Task.new task_params
        if @task.save
            redirect_to @task, notice: "Task Created."
        else
            render :new
        end
    end
    
    def show
    end
    
    def edit
    end
    
    def update
        if @task.update_attributes task_params
            redirect_to @task, notice: "Task Updated"
        else
            render :edit
        end
    end
    
    def destroy
       @task.destroy
       redirect_to tasks_path, notice: "Task Deleted"
    end
    
    private
    
    def load_task
        @task = Task.find params[:id] 
    end
    
    def task_params
       params.require(:task).permit(:name,:due_date,:priority) 
    end
    
end
