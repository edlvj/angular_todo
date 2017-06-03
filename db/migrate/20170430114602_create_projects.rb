class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.string   :title
      t.datetime :completed_at
      t.integer  :user, index: true
      t.timestamps
    end
  end
end
