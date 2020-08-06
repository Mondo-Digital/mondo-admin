require "rails_helper"

RSpec.describe Api::V1::NewsController, type: :controller do
  render_views

  before :each do
    stub_client_token_header
  end

  describe "GET index" do
    it "lists all news for a team" do
      team = Team.create(name: "teste_team")
      news1 = News.create(body: "body 1", team: team)
      news2 = News.create(body: "body 2", team: team)

      get :index, params: { team_id: team.id }, format: :json

      expect(response).to be_successful
      expect(response.body).to include(news1.to_json, news2.to_json)
    end
  end

  describe "POST create" do
    it "creates a news for that team" do
      team = Team.create(name: "teste_team")
      post :create, params: {
        team_id: team.id,
        body: "news test"
      }

      expect(response).to be_successful
      expect(News.last.team).to eq(team)
      expect(News.last.body).to eq("news test")
    end
  end
end
