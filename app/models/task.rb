class Task < ApplicationRecord
    validates :name, presence: true
    validates :priority, presence: true 
    validates :due_date, presence: true
end
