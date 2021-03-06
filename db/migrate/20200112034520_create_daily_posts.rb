class CreateDailyPosts < ActiveRecord::Migration[6.0]
  def change
    create_table :daily_posts do |t|
      t.string :title
      t.boolean :completed
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
