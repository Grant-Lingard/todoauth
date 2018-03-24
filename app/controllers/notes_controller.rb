class NotesController < ApplicationController
    before_action :authorize
    before_action :load_task  
    before_action :load_note,except: [:index, :new, :create]  
    
    def index
       @notes = @task.notes.all
    end   
    
    def new
        @note = Note.new
    end  
    
    def create
       @note = Note.new note_params
       if @task.notes << @note
           redirect_to task_notes_path, notice: "Note Created"
       else
           render :new
       end
    end   
    
    def show
    end
    
    def edit
    end
    
    def update
        if @note.update_attributes note_params
            redirect_to [@task,@note], notice: "Task updated"
        else
            render :edit
        end
    end   
    
    def destroy
        @note.destroy
        redirect_to task_notes_path(@task), notice: "Note Deleted"
    end   
    
    private
    
    def load_task
       @task = current_user.tasks.find params[:task_id]    
    end  
    
    def load_note
       @note = @task.notes.find params[:id]   
    end   
    
    def note_params
       params.require(:note).permit(:title,:body) 
    end   
end
