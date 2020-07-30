class CreateAlloweds < ActiveRecord::Migration[6.0]
  def change
    create_table :alloweds do |t|
      t.string :name

      t.timestamps
    end
  end
end
