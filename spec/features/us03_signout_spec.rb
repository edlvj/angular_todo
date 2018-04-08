include Support::Auth

feature 'Sign out', type: :feature, js: true do
  let(:user) { create :user, :confirmed }

  scenario 'When user success sign in' do
    sign_in username: user.username, password: user.password
    find('#logout').click
    expect(page).to have_content 'Sign In'
  end
end  