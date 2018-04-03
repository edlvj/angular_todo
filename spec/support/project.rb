module Support
  module Project
    def create_project(form_id = 'add_project', options)
      within "##{form_id}" do
        fill_in "title", with: options[:title]
        click_button "Create Project"
      end 
    end 
    
    def edit_project(form_id = 'update_project', options)
      within "##{form_id}" do
        fill_in "title", with: options[:title]
        click_button "Save"
      end   
    end
  end
end
   