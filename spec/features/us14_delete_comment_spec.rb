include Support::Auth

feature 'Delete a comment', type: :feature, js: true do
  let(:user) { create :user, :confirmed }

  background do
    @project = create :project, user: user
    @task = create :task, project: @project
    @comment = create :comment, task: @task 
    sign_in username: user.username,  password: user.password
  end

  before do
    first('#caret').click
  
    within 'task-list' do
      first('.list-group-item').hover
      find('#add_comment').click
    end
  end
  
  scenario 'When click on “Trash” icon' do
    within ".modal-content" do
      find_by_id('drop_comment').click
      expect(page).not_to have_content(@comment.title)
      find_by_id('cancel').click
    end

    within 'task-list' do
      first('.list-group-item').hover
      
      expect(page).not_to have_css('#comment_count')  
    end
  end
end  