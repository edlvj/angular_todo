class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.string   :title
      t.boolean  :done
      t.integer  :priority
      t.integer :project_id, index: true, name: :index_tasks_on_project_id, using: :btree
      t.datetime :deadline
      
      t.timestamps
    end
  end
end
