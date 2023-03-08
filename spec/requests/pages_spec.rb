RSpec.describe "Pages" do
  describe "GET /" do
    context "when the user is not signed in" do
      it "renders the root page" do
        get root_path
        expect(response).to have_http_status(:ok)
        expect(response.request.fullpath).to eq("/")
      end
    end

    context "when the user is signed in" do
      before { sign_in create(:user) }

      it "redirects to the dashboard page" do
        get root_path
        expect(response).to redirect_to(dashboard_path)
      end
    end
  end

  describe "GET /dashboard" do
    context "when the user is not signed in" do
      it "redirects to the root page" do
        get dashboard_path
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    context "when the user is signed in" do
      before { sign_in create(:user) }

      it "renders the dashboard page" do
        get dashboard_path
        expect(response).to have_http_status(:ok)
        expect(response.request.fullpath).to eq("/dashboard")
      end
    end
  end
end
