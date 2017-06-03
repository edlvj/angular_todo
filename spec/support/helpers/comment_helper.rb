module Support
  module Comment
    def create_comment(form_id = 'new_comment', options)
      within "##{form_id}" do
        fill_in "title", with: options[:title]
        click_button "Add Comment"
      end 
    end                                          
  end
end
   