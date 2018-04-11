module AuthenticationMacros
  def login_user
    user = FactoryBot.create :user
    ApplicationController.any_instance.stubs(:current_user).returns(user)
    user
  end    

  def reset_login  
    ApplicationController.any_instance.stubs(:current_user).returns(nil)
  end   
end