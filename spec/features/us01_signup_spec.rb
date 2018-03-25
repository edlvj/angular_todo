include Support::Auth

feature 'Sign up', type: :feature, js: true do

  scenario 'when user have valid credentials' do
    sign_up attributes_for(:user)
    expect(page).to have_content 'You’re successfully registered!'
    sleep 1
    expect(page).to have_content 'Projects'
  end

  scenario '​when user have an account' do
    user = create :user
    sign_up attributes_for(:user, username: user.username)
    expect(page).to have_content 'This login is already registered. Please, log in.'
  end

  scenario '​when user click on Already have an account' do
    visit '/sign_up'
    click_link("Sign In")
    expect(current_path).to eq '/sign_in'
  end

  describe '#validation' do
    before { visit '/sign_up' }
    
    context '#username' do 
      scenario 'username required' do
        within "#sign_up" do
          fill_in "username", with: ' '
        end
        expect(page).to have_content 'The field is required.'
      end

      scenario 'min 3 characters' do
        within "#sign_up" do
          fill_in "username", with: 'te'
        end
        expect(page).to have_content 'Username is too short. Minimum 3 characters.'
      end

      scenario 'max 50 characters' do
        within "#sign_up" do
          fill_in "username", with: FFaker::Lorem.paragraph
        end
        expect(page).to have_content 'Username is too long. Maximum 50 characters.'
      end
    end

    context '#password' do
      scenario 'must 8 characters' do
        within "#sign_up" do
          fill_in "password", with: 'te'
        end
        expect(page).to have_content 'Password does not meet minimal requirements. The length should be 8 characters, alphanumeric.'
      end
    end

    context '#password_confirmation' do
      scenario 'must 8 characters' do
        within "#sign_up" do
          fill_in "password", with: '11111111'
          fill_in "password_confirmation", with: '12345678'
        end
        expect(page).to have_content 'Password and Confirm password fields doesn’t match.'
      end
    end  
  end
end  