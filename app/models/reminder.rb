class Reminder < ApplicationRecord
    belongs_to :user
    
    validates :name, presence: true
    validates :priority, presence: true
end
