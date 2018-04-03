include Support::Auth
include Support::Project

feature 'Edit a project', type: :feature, js: true do
  let(:user) { create :user, :confirmed }

  background do
    sign_in username: user.username,  password: user.password
    @project = create :project, user: user
  end

  before do
    first('.panel-heading').hover
    find('#edit_project').click
  end  
  
  scenario 'When click on “Save” button' do
    edit_project title: 'kiss'
    
    within "project-list" do
      expect(page).to have_content('kiss')
    end
  end

  scenario 'When click on “Cancel” link' do
    within "#update_project" do
      fill_in "title", with: 'lost'
      find_by_id("cancel").click
    end 
    
    within "project-list" do
      expect(page).to have_content(@project.title)
    end
  end
end  