class UsersController < ApplicationController
    before_action :authorize, except: [:new, :create]
    
    def new
        if session[:user_hash]
            @user = User.create_from_hash(session[:user_hash].symbolize_keys)
            @user.valid?
        else
            @user = User.new
        end
    end
    
    def create
        if session[:user_hash]
            @user = User.create_from_hash(session[:user_hash].symbolize_keys)
            @user.name = user_params[:name]
            @user.email = user_params[:email]
        else
            @user = User.new(user_params)
        end
        if @user.save
            session[:user_hash] = nil
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
