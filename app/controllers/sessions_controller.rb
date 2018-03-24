class SessionsController < ApplicationController
    def new
    end
    
    def create
        @user = User.where(email: params[:email]).first
        if @user && @user.authenticate(params[:password])
            login(@user)
            location = session[:protected_page] ? session[:protected_page] : root_path
            session[:protected_page] = nil
            redirect_to location, notice: "You are logged in."
        else   
            redirect_to login_path, alert: "Invalid Email/Password."
        end   
    end
    
    def destroy
       logout
       redirect_to root_path, notice: "You are logged out."
    end
    
end
