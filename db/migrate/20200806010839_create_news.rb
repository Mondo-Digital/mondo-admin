class CreateNews < ActiveRecord::Migration[6.0]
  def change
    create_table :news do |t|
      t.integer :team_id
      t.string :body

      t.timestamps
    end
  end
end
