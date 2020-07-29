class AddFieldsToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :avatar_shot, :string
    add_column :users, :website, :string
    add_column :users, :gender, :text
  end
end
