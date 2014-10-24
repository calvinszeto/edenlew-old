require "rails_helper"

RSpec.describe Api::V1::ProjectsController do
  context "GET /api/v1/projects/" do
    before(:each) do
      (1..3).each do |_|
        create(:project)
      end
      @projects = Project.all
    end

    it "should return all projects" do
      get :index, format: :json
      expect(response.status).to eq(200)
      expect(assigns(:projects)).to eq(@projects)
    end
  end
end