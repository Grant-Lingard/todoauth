class Note < ApplicationRecord
    belongs_to :task 
    
    validates :title, presence: true 
    validates :body, presence: true  
    validates :task, presence: true   
end
