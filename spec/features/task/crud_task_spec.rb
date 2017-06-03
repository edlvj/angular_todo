include Support::Auth
include Support::Task

feature 'Crud task', type: :feature, js: true do
  let(:user) { create :user }

  background do
    @project = create :project, user: user
    @task = create :task, project: @project
    sign_in email: user.email,  password: user.password
    sleep 1
  end
 
  scenario 'user can update task title' do
    old_title = @task.title
    first('#task_edit').click
    update_task title: 'New title' 
    expect(page).to have_content('New title')
    expect(page).to have_no_content(old_title)
  end
  
  scenario 'user can delete project' do
    first('#task_drop').click
    expect(page).to have_no_content(@task.title)
  end

  scenario 'user can create new project' do
    create_task title: 'newtask'
    expect(page).to have_content('newtask')
  end
end 
