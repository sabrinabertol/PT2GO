class AddPtToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :pt, :boolean
  end
end
