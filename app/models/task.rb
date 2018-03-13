class Task < ApplicationRecord
    has_many :notes
    
    validates :name, presence: true 
    validates :priority, presence: true 
    validates :due_date, presence: true
end
