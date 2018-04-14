require 'test_helper'

class RemindersTest < ActionDispatch::IntegrationTest
  
  #DO NOT COPY AND PASTE FROM THIS FILE
  
  test "reminders protected" do
    visit reminders_path
    
    assert_equal page.current_path, login_path
    assert page.has_content?("You must login")
  end
  
  #TODO Write an index page test.
  #Create at least 2 reminders using Factory Bot
  #Visit the index page
  #assert that the 2 reminder names are on the page.
  
  test "create a new reminder" do
    login_user
    visit reminders_path
    click_link "New Reminder"

    fill_in "Name", with: "Finish Testing"
    fill_in "Priority", with: "1"
    click_on "Create Reminder"
    #puts page.html
    assert page.has_content?("created reminder")
    assert page.has_content?("Finish Testing")
  end   
  
  test "create without name fails" do
    login_user
    visit new_reminder_path     
    
    fill_in "Priority", with: "1"
    click_on "Create Reminder"
    
    assert_equal page.current_path, reminders_path
    assert page.has_content?("fix the errors")
    assert page.has_content?("can't be blank")
  end
  
  #TODO Write an update test (use FactoryBot to create a reminder to update)
  
  test "delete reminder" do
    user = login_user     
    reminder = FactoryBot.create :reminder, user: user
    
    visit reminder_path(reminder)
    click_link "Delete"
    
    assert_equal reminders_path, page.current_path
    assert page.has_content?("deleted reminder")
    refute page.has_content?(reminder.name)
  end
  
end
