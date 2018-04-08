include Support::Auth

feature 'Sign in', type: :feature, js: true do
  let(:user) { create :user, :confirmed }

  scenario 'When user success sign in' do
    sign_in username: user.username, password: user.password
    expect(page).to have_content 'Projects'
  end

  scenario 'When user invalid sign in' do
    sign_in email: 'fake@gg.com', password: 'fakepass'
    expect(page).to have_content 'Incorrect login or password'
  end

  scenario '​when user click on ​Don’t have an account' do
    visit '/sign_in'
    click_link("Sign Up")
    expect(current_path).to eq '/sign_up'
  end
end  