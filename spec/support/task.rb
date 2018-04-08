module Support
  module Task
    def create_task(form_id = 'add_task', options)
      within "##{form_id}" do
        fill_in "title", with: options[:title]
        click_button "Add Task"
      end 
    end  
    
    def edit_task(form_id = 'update_task', options)
      within "##{form_id}" do
        fill_in "title", with: options[:title]
        click_button "Save"
      end 
    end   
  end
end