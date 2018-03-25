include Support::Auth
include Support::Comment

feature 'Add a task', type: :feature, js: true do
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
      find('#add_comment').click
    end
  end

  scenario 'When click on “Save” button' do
    within ".modal-content" do
      create_comment 'add_comment', false, title: 'fuckup'
      expect(page).to have_content('fuckup')
      find_by_id('cancel').click
    end

    within 'task-list' do
      first('.list-group-item').hover
      
      comment_count = find_by_id('comment_count')
      expect(comment_count).to have_content('1')  
    end
  end

  scenario 'When click on “Cancel” button' do
    within ".modal-content" do
      within "#add_comment" do
        fill_in "title", with: 'crocus'
        find_by_id('cancel').click
      end 
      expect(page).not_to have_content('crocus')
    end
  end

  context '#with_attachment' do
    scenario 'When click on “Save” button with title and text attachment' do
      within ".modal-content" do
        options = attributes_for(:comment, :with_text_attachment)
        create_comment 'add_comment', true, options
        expect(page).to have_content('Wrong file format. You can upload a *.jpg or *.png formats files only')
      end
    end

    scenario 'When click on “Save” button with title and img attachment' do
      within ".modal-content" do
        options = attributes_for(:comment, :with_img_attachment)
        create_comment 'add_comment', true, options

        expect(page).not_to have_content(options[:title])
      end
    end
  end  
end  