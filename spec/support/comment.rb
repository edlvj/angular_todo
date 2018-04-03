module Support
  module Comment
    def create_comment(form_id = 'add_comment', attach = false, options)
      within "##{form_id}" do
        fill_in "title", with: options[:title]
        attach_file 'attachment', File.absolute_path(options[:attachment].path), visible: :hidden if attach
        click_button "Save"
      end 
    end                                          
  end
end
   