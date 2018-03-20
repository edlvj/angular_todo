include Support::Auth
include Support::Project

feature 'Delete a project', type: :feature, js: true do
  let(:user) { create :user, :confirmed }

  background do
    sign_in username: user.username,  password: user.password
    @project = create :project, user: user
    sleep 1
  end
  
  scenario 'When click on “Save” button' do
    first('.panel-heading').hover
    find('#drop_project').click

    within '.modal-content' do
      expect(page).to have_content("Do you really want to delete \"#{ @project.title }\"?")
      click_button "Delete"
    end  
    
    within "project-list" do
      expect(page).not_to have_content(@project.title)
    end
  end

  scenario 'When click on “Cancel” button' do
    first('.panel-heading').hover
    find('#drop_project').click

    within '.modal-content' do
      find_by_id("cancel").click
    end  
    
    within "project-list" do
      expect(page).to have_content(@project.title)
    end
  end
end  