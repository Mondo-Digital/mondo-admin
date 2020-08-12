require "rails_helper"

RSpec.describe Api::V1::NewsController, type: :controller do
  render_views

  before :each do
    stub_client_token_header
  end

  describe "GET index" do
    it "lists all news for a team" do
      team = Team.create(name: "teste_team")
      news1 = News.create(title: "title1", body: "body 1", link: "link1", team: team)
      news2 = News.create(title: "title2", body: "body 2", link: "link2", team: team)

      get :index, params: { token: team.access_token }, format: :json

      expect(response).to be_successful
      expect(response.body).to eq(
        Presenters::News::Alexa.parse([news1, news2]).to_json
      )
    end
  end

  describe "POST create" do
    it "creates a news for that team" do
      team = Team.create(name: "teste_team")
      post :create, params: {
        token: team.access_token,
        body: "body test",
        title: "title test",
        link: "read_more"
      }

      expect(response).to be_successful
      expect(News.last.team).to eq(team)
      expect(News.last.body).to eq("body test")
      expect(News.last.title).to eq("title test")
      expect(News.last.link).to eq("read_more")
    end
  end
end
