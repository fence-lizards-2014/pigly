module AuthenticationHelpers
  def stub_current_user user
    ApplicationController.any_instance.stub(:current_user) { user }
  end
end