class Team < ApplicationRecord
  has_many :users

  rails_admin do
    list do
      field :id
      field :name
      field :users
      field :created_at
      field :updated_at
    end
  end
end
