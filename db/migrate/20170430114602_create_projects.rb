class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.string   :title, null: false
      t.datetime :completed_at
      t.integer  :user_id, index: true, foreign_key: true, on_delete: :cascade, name: :index_projects_on_user_id, using: :btree
      t.timestamps
    end
  end
end
