class AddImageShotToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :image_shot, :string
  end
end
