include Support::Auth

feature 'Sign in', type: :feature, js: true do
  let(:user) { create :user }
  
  scenario 'When user success sign in' do
    sign_in email: user.email, password: user.password
    expect(page).to have_content 'ADD TODO List'
  end
 
  scenario 'When user invalid sign in' do
    sign_in email: 'fake@gg.com', password: 'fakepass'
    expect(page).to have_content 'Invalid login credentials.'
  end
end