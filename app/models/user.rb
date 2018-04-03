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
    
    def self.create_from_hash(user_hash)
       user = User.new
       user.name = user_hash[:name]
       user.email = user_hash[:email]
       user.uid = user_hash[:uid]
       user.token = user_hash[:token]
       user.password_digest = "0"
       user
    end
    
    def has_password
       self.password_digest.nil? || self.password_digest != "0"
    end
    
end
