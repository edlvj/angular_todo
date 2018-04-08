include Support::Auth

feature 'Setup Deadline', type: :feature, js: true do
  let(:user) { create :user, :confirmed }

  background do
    @project = create :project, user: user
    @task = create :task, project: @project 
    sign_in username: user.username,  password: user.password
  end
  
  before :each do 
    first('#caret').click
  
    within 'task-list' do
      first('.list-group-item').hover
      find('#deadline_task').click
    end
  end
  
  context '#show' do
    scenario '​have form with date and time input' do

      within '.modal-content' do
        expect(page).to have_content('Date')
        expect(page).to have_content('Time')

        find_by_id("deadline_date").click
        expect(page).to have_css('.datetimepicker')

        find_by_id("deadline_time").click
        expect(page).to have_css('.datetimepicker')
      end
    end
  end

  context '#form' do
    let(:today) { Date.today }
    let(:tommorow) { today + 1.day }

    context '#save' do
      scenario '​When date is tomorrow or after' do
        within '.modal-content' do
          find_by_id("deadline_date").click
          find('td', text: today.day).click

          click_button "Save"
        end

        expect(page).to have_css('p.red')
        expect(page).to have_content(today.strftime("%d/%m/%Y"))
      end

      scenario '​When date is is today or earlier' do
        within '.modal-content' do
          find_by_id("deadline_date").click
          find('td', text: tommorow.day).click

          click_button "Save"
        end

        expect(page).to have_css('p.green')
        expect(page).to have_content(tommorow.strftime("%d/%m/%Y"))
      end
    end

    scenario 'When click on “Cancel” button' do 
      within '.modal-content' do
        find_by_id("deadline_date").click
        find('td', text: today.day).click
        
        find_by_id("cancel").click
      end
      
      expect(page).not_to have_css('.modal-content')
      expect(page).not_to have_content(today.strftime("%d/%m/%Y"))
    end  
  end 
end  