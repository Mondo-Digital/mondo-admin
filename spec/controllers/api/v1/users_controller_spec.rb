require 'rails_helper'

RSpec.describe Api::V1::UsersController, type: :controller do
  it 'tests' do
    post :create, params: {
      email: 'teste@email.com'
    }

    expect(response).to be_successful
    expect(User.last.email).to eq('teste@email.com')
  end
end
