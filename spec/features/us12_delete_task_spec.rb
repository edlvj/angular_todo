include Support::Auth

feature '​​Delete a Task', type: :feature, js: true do
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
      find('#remove_task').click
    end
  end

  scenario 'show form' do
    within '.modal-content' do
      expect(page).to have_content("Do you really want to delete \"#{ @task.title }\" ?")
      expect(page).to have_button('Delete')
    end  
  end  

  context "#form" do
    scenario 'When click on “Delete” button' do
      within '.modal-content' do
        click_button "Delete"
      end

      within "task-list" do
        expect(page).not_to have_content(@task.title)
      end
    end

    scenario 'When click on “Cancel” button' do
      within '.modal-content' do
        click_button "Cancel"
      end  
    
      within "task-list" do
        expect(page).to have_content(@task.title)
      end
    end
  end  
end  