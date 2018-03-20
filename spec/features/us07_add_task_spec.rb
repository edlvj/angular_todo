include Support::Auth
include Support::Task

feature 'Add a task', type: :feature, js: true do
  let(:user) { create :user, :confirmed }

  background do
    @project = create :project, user: user
    @task = create :task, project: @project 
    sign_in username: user.username,  password: user.password
    sleep 1
  end
 
  context '#show' do
    before { first('#caret').click }
    
    scenario '​list of tasks' do
      within "task-list" do
        expect(page).to have_content(@task.title)
      end
    end  

    scenario '​form inside a project' do
      within "task-new" do
        expect(page).to have_field('title')
      end  
    end 
  end

  context '#form' do
    before { first('#caret').click }

    scenario 'When click on “Add Task” button' do
      within "task-new" do
        create_task title: 'kiss'
      end  
      within "task-list" do
        expect(page).to have_content('kiss')
      end
    end
    
    scenario 'When click on “Cancel” button' do
      within "#add_task" do
        fill_in "title", with: 'kiss'
        find_by_id("cancel").click
      end 
      within "task-list" do
        expect(page).not_to have_field('title', :with => '')
        expect(page).not_to have_content('kiss')
      end
    end
  end
end  