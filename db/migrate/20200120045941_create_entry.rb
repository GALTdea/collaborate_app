class CreateEntry < ActiveRecord::Migration[6.0]
  def change
    create_table :entries do |t|
      t.text :title
      t.references :user, foreign_key: true
      t.references :daily_post, null: false, foreign_key: true
    end
  end
end
