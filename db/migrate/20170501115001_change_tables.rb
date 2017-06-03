class ChangeTables < ActiveRecord::Migration[5.0]
  def change
    add_index :tasks, [:project_id], name: :index_tasks_on_project_id, using: :btree
    add_index :projects, [:user_id], name: :index_projects_on_user_id, using: :btree
  end
end
