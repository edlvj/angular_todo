class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.string   :title
      t.datetime :completed_at
      t.integer  :user_id, index: true, name: :index_projects_on_user_id, using: :btree
      t.timestamps
    end
  end
end
