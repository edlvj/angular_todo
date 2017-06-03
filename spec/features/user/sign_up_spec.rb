include Support::Auth

feature 'Sign up', type: :feature, js: true do

  scenario 'When user success sign up' do
    sign_up attributes_for(:user)
    expect(page).to have_content 'ADD TODO List'
  end

  scenario 'User use invalid email' do
    user = create :user
    sign_up attributes_for(:user, email: user.email)
    expect(page).to have_content 'Email has already been taken'
  end
end