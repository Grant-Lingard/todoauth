class Task < ApplicationRecord
    has_many :notes, dependent: :destroy   
    
    validates :name, presence: true   
    validates :priority, presence: true    
    validates :due_date, presence: true  
end
