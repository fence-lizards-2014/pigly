require 'spec_helper'

feature "Session sign-in" do
	let(:user) { FactoryGirl.create :user }
	scenario "succeeds when user signs in with valid information" do
		visit new_session_path
		fill_in "email", with: user.email
		fill_in "password", with: user.password
		click_button "Sign In"
		expect(page).to have_content "Successfully signed in."
	end

	scenario "fails when user signs in with invalid information" do
		visit new_session_path
		fill_in "email", with: user.email
		fill_in "password", with: ""
		click_button "Sign In"
		expect(page).to have_content "Invalid email or password"
	end
end

feature "Session sign-out" do
	let(:user) { FactoryGirl.create :user }
	scenario "logs out a signed-in user" do
		stub_current_user(user)
		visit logout_path
		expect(page).to have_content "Have a Pigly day."
	end
end