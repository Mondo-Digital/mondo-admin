class News < ApplicationRecord
  resourcify

  belongs_to :team
end
