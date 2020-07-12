require 'rails_helper'

RSpec.describe Api::V1::UsersController, type: :controller do
  before :each do
    stub_client_token_header
  end

  it 'tests' do
    post :create, params: {
      name: 'John Doe',
      email: 'teste@email.com'
    }

    expect(response).to be_successful
    expect(User.last.email).to eq('teste@email.com')
    expect(User.last.name).to eq('John Doe')
  end
end
