class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :title
      t.text :comment
      t.boolean :star
      t.datetime :completed_at
      t.datetime :deadline_at

      t.timestamps
    end
  end
end
