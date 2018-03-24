class User < ApplicationRecord
    has_secure_password
    
    has_many :tasks
    
    validates :name, presence: true   
    validates :email, format: { with: /@/, message: "needs an @" }, uniqueness: true
    
    attr_accessor :current_password  
    
    def update_with_password(params)
       if self.authenticate(params[:current_password])
           self.update_attributes(params)
       else   
           self.errors.add(:current_password, "is incorrect.")
           false
       end   
    end  
    
end
