class AlterUserDescription < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :describtion, :description
  end
end
