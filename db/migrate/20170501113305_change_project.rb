class ChangeProject < ActiveRecord::Migration[5.0]
  def change
    remove_column :projects, :user
    add_column :projects, :user_id, :integer, index: true
  end
end
