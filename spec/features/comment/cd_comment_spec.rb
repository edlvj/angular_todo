include Support::Auth
include Support::Comment

feature 'Cd comment', type: :feature, js: true do
  let(:user) { create :user }

  background do
    @project = create :project, user: user
    @task = create :task, :with_comments, project: @project
    sign_in email: user.email,  password: user.password
    sleep 1
  end
  
  scenario 'user can delete comment' do
    first('#show_comment').click
    first('#drop_comment').click
    expect(page).to have_no_content(@task.comments.first.title)
  end

  scenario 'user can create new comment' do
    first('#show_comment').click
    create_comment title: 'newcomm'
    expect(page).to have_content('newcomm')
  end
end