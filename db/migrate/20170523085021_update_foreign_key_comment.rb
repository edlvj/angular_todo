class UpdateForeignKeyComment < ActiveRecord::Migration[5.0]
  def change
    remove_foreign_key :comments, :tasks

    add_foreign_key :comments, :tasks, on_delete: :cascade
  end
end
