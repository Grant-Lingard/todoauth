require 'test_helper'

class ReminderTest < ActiveSupport::TestCase
  test "has valid factory" do
    reminder = FactoryBot.build :reminder
    
    assert reminder.valid?
  end
  
  test "presence of required fields" do
    reminder = Reminder.new
    assert validate_presence_of(:name), reminder
    assert validate_presence_of(:priority), reminder
  end
  
  test "relationships" do
    reminder = Reminder.new
    
    assert belong_to(:user), reminder
  end
end
