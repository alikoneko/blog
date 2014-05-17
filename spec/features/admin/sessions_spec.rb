require 'spec_helper'

feature "Admin/Sessions" do

  given!(:user){ create :user }

  scenario "ali logs in" do
    visit admin_posts_path

    fill_in :session_form_email, with: user.email
    fill_in :session_form_password, with: user.password

    click_button :submit_login

    expect(page).to have_content 'Welcome'
  end

end