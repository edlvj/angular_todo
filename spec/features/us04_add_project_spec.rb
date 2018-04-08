include Support::Auth
include Support::Project

feature 'Add project', type: :feature, js: true do
  let(:user) { create :user, :confirmed }

  background do
    sign_in username: user.username,  password: user.password
  end

  context '#show buttons' do 
    scenario 'When emtpy title not show button' do
      expect(page).not_to have_button('Create Project')
      expect(page).not_to have_button('Cancel')
    end

    scenario 'When enter title show buttons' do
      within "#add_project" do
        fill_in "title", with: 'new'
      end 
      expect(page).to have_button('Create Project')
      expect(page).to have_button('Cancel')
    end
  end

  scenario 'When click on “Create Project” button' do
    create_project title: 'kiss'
    within "project-list" do
      expect(page).to have_content('kiss')
    end
  end

  scenario 'When click on “Cancel” button' do
    within "#add_project" do
      fill_in "title", with: 'new'
    end
    click_button "Cancel"
    expect(page).not_to have_button('Create Project')
    expect(page).not_to have_content('new') 
  end 

  scenario 'When project have same title' do
    project = create :project, user: user
    create_project title: project.title
    expect(page).to have_content('The project with such name does already exist.')
  end 
end  