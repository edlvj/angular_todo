module Support
  module Project
    def create_project(form_id = 'new_project', options)
      within "##{form_id}" do
        fill_in "title", with: options[:title]
        click_button "Create Project"
      end 
    end 
    
    def update_project(form_id = 'update_project', options)
      within "##{form_id}" do
        fill_in "title", with: options[:title]
        click_button "Update Project"
      end   
    end
    
  end
end
   