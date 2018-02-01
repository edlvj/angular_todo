class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.string   :title
      t.boolean  :done
      t.integer  :priority
      t.integer :project, index: true
      
      t.timestamps
    end
  end
end
