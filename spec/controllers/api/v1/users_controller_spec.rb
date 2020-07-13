require 'rails_helper'

RSpec.describe Api::V1::UsersController, type: :controller do
  before :each do
    stub_client_token_header
  end

  describe 'POST create' do
    it 'creates an user' do
      post :create, params: {
        name: 'John Doe',
        email: 'teste@email.com',
        amazon_user_id: 'AMZN.user.1'
      }

      expect(response).to be_successful
      expect(User.last.email).to eq('teste@email.com')
      expect(User.last.name).to eq('John Doe')
    end

    it 'updates information if same amazon id is given' do
      params = {
        name: 'John Doe',
        email: 'teste@email.com',
        amazon_user_id: 'AMZN.user.1',
        password: Devise.friendly_token
      }

      User.create!(params)

      post :create, params: {
        name: 'Another Name Doe',
        email: 'updated@email.com',
        amazon_user_id: 'AMZN.user.1'
      }

      expect(response).to be_successful
      expect(User.last.email).to eq('updated@email.com')
      expect(User.last.name).to eq('Another Name Doe')
    end
  end
end
