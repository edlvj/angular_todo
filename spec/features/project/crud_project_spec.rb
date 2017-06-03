include Support::Auth
include Support::Project

feature 'Crud project', type: :feature, js: true do
  let(:user) { create :user }

  background do
    @project = create :project, user: user
    sign_in email: user.email,  password: user.password
    sleep 1
  end

  scenario 'user can update project' do
    old_title = @project.title
    first('#prod_edit').click
    update_project title: 'updatedProd'
    expect(page).to have_content('updatedProd')
    expect(page).to have_no_content(old_title)
  end
  
  scenario 'user can delete project' do
    first('#prod_drop').click
    expect(page).to have_no_content(@project.title)
  end
  
  scenario 'user can create new project' do
    first(:button, 'ADD TODO List').click
    create_project title: 'newprod'
    expect(page).to have_content('newprod')
  end
end