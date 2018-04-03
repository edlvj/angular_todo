include Support::Auth

feature 'Prioritization', type: :feature, js: true do
  let(:user) { create :user, :confirmed }

  background do
    @project = create :project, user: user
    @task = create :task, project: @project, title: "1", priority: 1
    @task_2 = create :task, project: @project, title: "2", priority: 2
    sign_in username: user.username,  password: user.password
  end

  before :each do 
    first('#caret').click
  end

  context '#move' do
    scenario 'When click on “Up arrow” icon' do
      within 'task-list' do
        all('.list-group-item')[1].hover
        find('#move_up').click
      end
      
      tasks = all('.list-group-item')
      expect(tasks[0]).to have_content(@task_2.title)
    end

    scenario 'When click on “Down arrow” icon' do
      within 'task-list' do
        all('.list-group-item')[0].hover
        find('#move_down').click
      end

      tasks = all('.list-group-item')
      expect(tasks[1]).to have_content(@task.title)
    end
  end  
end  