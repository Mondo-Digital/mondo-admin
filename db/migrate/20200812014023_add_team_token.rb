class AddTeamToken < ActiveRecord::Migration[6.0]
  def change
    add_column :teams, :access_token, :string
    add_index :teams, :access_token
  end
end
