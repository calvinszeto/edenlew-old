describe Api::V1::ProjectsController do
  context "GET /api/v1/projects/" do
    before(:each) do
      (1..3).each do |_|
        create(:project)
      end
      @projects = Project.all
    end

    it "should return all projects" do
      get api_v1_projects_path
      expect(response.status).to eq(200)
    end
  end
end