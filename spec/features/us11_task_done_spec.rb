include Support::Auth

feature '​Task is Done', type: :feature, js: true do
  let(:user) { create :user, :confirmed }

  background do
    @project = create :project, user: user
    @task = create :task, project: @project
    @task_2 = create :task, project: @project
    sign_in username: user.username,  password: user.password
    sleep 1
  end

  before do
    sleep 1
    first('#caret').click
  
    within 'task-list' do
      first('.list-group-item').hover
    end
  end

  scenario 'When put a tick in a checkbox' do
    within 'task-list' do
      first('#done').click
      expect(page).to have_css('p.checked')
    end
  end

  scenario 'When putted ticks in all task’s checkboxes in the project' do
    within 'task-list' do
      all('#done').each do |el|
        el.hover
        el.click
      end
    end
    expect(page).to have_content('Well done! You’re successfully completed all the task.')
  end  
end  