class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.string :title, null: false
      t.string :attachment
      t.references :task, foreign_key: true, on_delete: :cascade

      t.timestamps
    end
  end
end
