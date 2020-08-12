class Team < ApplicationRecord
  has_many :users
  has_many :news

  before_create :generate_access_token

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

  def generate_access_token
    self.access_token = SecureRandom.hex
  end
end
