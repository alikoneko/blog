require 'spec_helper'

feature "Admin/Sessions" do

  let!(:user){ create :user }

  scenario "ali logs in" do

    sign_in user

    expect(page).to have_content 'Welcome'
  end

end