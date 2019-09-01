class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.references :document, foreign_key: true
      t.string :image

      t.timestamps
    end
  end
end
