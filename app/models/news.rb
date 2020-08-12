class News < ApplicationRecord
  resourcify

  belongs_to :team

  validates :title, presence: true
  validates :body, presence: true
end
