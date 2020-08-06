class User < ApplicationRecord
  resourcify
  rolify

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :recoverable,
         :registerable, :rememberable, :validatable

  belongs_to :team, optional: true

  rails_admin do
    list do
      field :id
      field :email
      field :amazon_user_id
      field :team
      field :roles
      field :created_at
      field :updated_at
    end

    object_label_method do
      :label
    end
  end

  def label
    name || email
  end
end
