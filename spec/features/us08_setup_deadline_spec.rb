include Support::Auth
include Support::Task

feature 'Setup Deadline', type: :feature, js: true do
  let(:user) { create :user, :confirmed }

  background do
    @project = create :project, user: user
    @task = create :task, project: @project 
    sign_in username: user.username,  password: user.password
    sleep 1
  end

  # context '#show' do
  #   before do 
  #     visit '/'
  #   end
    
  #   scenario '​have form with date and time input' do
  #     sleep 1
  #     first('#caret').click
      
  #     within 'task-list' do
  #       first('.list-group-item').hover
  #       find('#deadline_task').click

  #       within '.modal-content' do
  #         expect(page).to have_content('Date')
  #         expect(page).to have_content('Time')
  #       end  
  #     end
  #   end  
  # end

  
end  