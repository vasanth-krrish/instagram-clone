class AddIndexToFollowings < ActiveRecord::Migration[6.0]
  def change
    add_index :followings, [:user_id, :following], unique: true
  end
end
