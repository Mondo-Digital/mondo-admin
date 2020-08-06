class Team < ApplicationRecord
  has_many :users
  has_many :news

  rails_admin do
    list do
      field :id
      field :name
      field :users
      field :news
      field :created_at
      field :updated_at
    end
  end
end
