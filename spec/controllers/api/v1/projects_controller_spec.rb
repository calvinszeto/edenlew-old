require "rails_helper"

RSpec.describe Api::V1::ProjectsController do
  context "GET /api/v1/projects/" do
    before(:each) do
      (1..3).each do |_|
        create(:project)
      end
      (1..3).each do |_|
        create(:project, visible: true)
      end
      @projects = Project.where(visible: true)
    end

    it "should return all visible projects" do
      get :index, format: :json
      expect(response.status).to eq(200)
      expect(assigns(:projects)).to eq(@projects)
    end
  end

  context "GET /api/v1/project/:id" do
    before(:each) do
      @project = create(:project)
    end

    it "should return the project if visible" do
      @project.update_attribute :visible, true
      get :show, id: @project.id, format: :json
      expect(response.status).to eq(200)
    end

    it "should return a 404 if the project is not visible" do
      get :show, id: @project.id, format: :json
      expect(response.status).to eq(404)
    end
  end
end