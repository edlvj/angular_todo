include Support::Auth
include Support::Task

feature 'Edit a task', type: :feature, js: true do
  let(:user) { create :user, :confirmed }

  background do
    @project = create :project, user: user
    @task = create :task, project: @project
    sign_in username: user.username,  password: user.password
    sleep 1
  end

  before do
    sleep 1
    first('#caret').click
  
    within 'task-list' do
      first('.list-group-item').hover
      find('#edit_task').click
    end
  end  
  
  scenario 'When click on “Save” button' do
    within 'task-list' do
      edit_task title: 'kiss'
      expect(page).to have_content('kiss')
    end
  end

  scenario 'When click on “Cancel” link' do
    within 'task-edit' do
      within '#update_task' do
        fill_in 'title', with: 'losk'
        find_by_id('cancel').click
      end 
    end
    within 'task-list' do
      expect(page).to have_content(@task.title)
    end
  end
end  