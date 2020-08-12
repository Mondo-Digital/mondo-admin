class CreateNews < ActiveRecord::Migration[6.0]
  def change
    create_table :news, id: :uuid do |t|
      t.integer :team_id
      t.string :title
      t.string :body
      t.string :link

      t.timestamps
    end
  end
end
