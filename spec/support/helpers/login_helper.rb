module Support
  module Auth
   
    def sign_up(form_id = 'sign_up', options)
      visit '/sign_up'
      within "##{form_id}" do
        fill_in "username", with: options[:username]
        fill_in "password", with: options[:password]
        fill_in "password_confirmation", with: options[:password_confirmation]
        click_button "Sign Up"
      end
    end
    
    def sign_in(form_id = 'sign_in', options)
      visit '/sign_in'
      within "##{form_id}" do
        fill_in "username", with: options[:username]
        fill_in "password", with: options[:password]
        click_button "Sign In"
      end
    end
  end
end