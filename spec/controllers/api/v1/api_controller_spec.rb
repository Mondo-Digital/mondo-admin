require "rails_helper"

RSpec.describe Api::V1::ApiController do
  controller do
    before_action :validate_api_token!

    def index
      render json: {}, status: :ok
    end
  end

  let(:valid_token) { "S3CR3TT0K3N" }

  context "when client token is valid" do
    it "returns 200" do
      stub_const("ENV", "CLIENT_TOKEN" => valid_token)

      request.headers["HTTP_CLIENT_TOKEN"] = valid_token
      get :index,
          params: {}

      expect(response).to be_successful
    end
  end

  context "when client token is not valid" do
    xit "returns 403" do
      stub_const("ENV", "CLIENT_TOKEN" => valid_token)

      request.headers["HTTP_CLIENT_TOKEN"] = "some-token"
      get :index,
          params: {}

      expect(response.status).to eq(403)
    end
  end
end
