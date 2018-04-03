class AuthenticationsController < ApplicationController
    
    def create
        #render json: omni_hash.to_json
        #return #uncomment to debug
        #render json: user_hash.to_json
        #return
        user = User.where(uid: user_hash[:uid]).first
        if user
            login(user)
            redirect_to root_path, notice: "You are logged in."
        else
            user = User.create_from_hash(user_hash)
            if user.save
               login(user)
               redirect_to root_path, notice: "You successfully signed up."
            else
                session[:user_hash] = user_hash
                redirect_to register_path, notice: "Please fill in the missing information."
            end
        end
    end
    
    private
    
    def omni_hash
        request.env['omniauth.auth']
    end
    
    def user_hash
       hash = {}
       hash[:uid] = omni_hash['uid']
       if omni_hash['info'] 
          hash[:name] = omni_hash['info']['name']
          hash[:email] = omni_hash['info']['email']
       end
       if omni_hash['credentials']['token']
          hash[:token] = omni_hash['credentials']['token']
       end
       hash
    end
end
