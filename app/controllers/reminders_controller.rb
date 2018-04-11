class RemindersController < ApplicationController
    before_action :authorize
    before_action :load_reminder, except: [:index, :new, :create]
    
    def index
       @reminders = current_user.reminders.all 
    end
    
    def new
       @reminder = Reminder.new 
    end
    
    def create
        @reminder = Reminder.new(reminder_params)
        @reminder.user = current_user
        if @reminder.save
            redirect_to @reminder, notice: "Successfully created reminder." 
        else
            render :new
        end
    end
    
    def show
    end
    
    def destroy
       @reminder.destroy
       redirect_to reminders_path, notice: "Successfully deleted reminder."
    end
    
    private
    
    def load_reminder
      @reminder = current_user.reminders.find params[:id]  
    end
    
    def reminder_params
       params.require(:reminder).permit(:name,:priority) 
    end
    
end
