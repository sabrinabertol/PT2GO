class CreateSessions < ActiveRecord::Migration[6.0]
  def change
    create_table :sessions do |t|
      t.string :name
      t.string :tipo
      t.string :description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
