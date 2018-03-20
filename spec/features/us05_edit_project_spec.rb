include Support::Auth
include Support::Project

feature 'Edit a project', type: :feature, js: true do
  let(:user) { create :user, :confirmed }

  background do
    sign_in username: user.username,  password: user.password
    @project = create :project, user: user
    sleep 1
  end
  
  scenario 'When click on “Save” button' do
    first('.panel-heading').hover
    find('#edit_project').click
    
    edit_project title: 'kiss'
    
    within "project-list" do
      expect(page).to have_content('kiss')
    end
  end

  scenario 'When click on “Cancel” link' do
    first('.panel-heading').hover
    find('#edit_project').click
    find_link('Cancel').click
    
    within "project-list" do
      expect(page).to have_content(@project.title)
    end
  end
end  