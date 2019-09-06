class AddImageCommentToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :image_comment, :string

  end
end
