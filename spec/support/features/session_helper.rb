module Features
  module SessionHelper
    def sign_in(user, opts = {})
      email = opts.fetch(:email) { user.email }
      password = opts.fetch(:password) { user.password }

      visit new_sessions_path

      fill_in 'session_form_email', with: email
      fill_in 'session_form_password', with: password

      click_button 'session_form_submit'
    end
  end
end