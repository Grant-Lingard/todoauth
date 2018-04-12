require 'test_helper'

class SitesTest < ActionDispatch::IntegrationTest
  test "Homepage" do
    visit root_path
    
    #puts page.html
    
    assert page.has_content?("Welcome")
    assert page.has_content?("task manager")
  end
  
  test "About" do
    visit about_path
    
    assert page.has_content?("About")
  end
end
