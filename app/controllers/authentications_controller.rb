class AuthenticationsController < ApplicationController
    
    def create
        render json: user_hash.to_json
    end
    
    private
    
    def user_hash
        request.env['omniauth.auth']
    end
end
