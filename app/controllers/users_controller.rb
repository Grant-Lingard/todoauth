class UsersController < ApplicationController
    before_action :authorize, except: [:new, :create]
    
    def new
        @user = User.new
    end
    
    def create
        @user = User.new(user_params)
        if @user.save
           login(@user)  
           redirect_to root_path, notice: "Successfully signed up!" 
        else    
            render :new
        end      
    end
    
    def edit
        @user = current_user
    end  
    
    def update
        @user = current_user
        if @user.update_with_password(user_params)
            redirect_to tasks_path, notice: "Account updated"
        else  
            render :edit
        end
    end
    
    #TODO 
    #add show and destroy
    
    private
    
    def user_params
       params.require(:user).permit(:name,:email,:password,:password_confirmation,:current_password) 
    end  
    
end
