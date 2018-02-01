class ChangeTasks < ActiveRecord::Migration[5.0]
  def change
    remove_column :tasks, :project
    add_column :tasks, :project_id, :integer, index: true
  end
end
