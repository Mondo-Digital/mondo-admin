class AddAmazonIdToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :amazon_user_id, :string
  end
end
