RSpec.describe Api::ProjectsController, type: :controller do
  let(:user) { create :user }
  
  before do
    @project = create :project, title: 'uniq', user: user
    sign_in user
    request.headers.merge!(user.create_new_auth_token)
  end
  
  describe 'GET #index' do
    it 'return status 200' do
      get :index
      expect(response).to be_success
    end
  end
  
  describe 'POST #create' do
    let(:valid_params) { { project: attributes_for(:project) } }

    it 'return status 200' do
      post :create, params: valid_params
      expect(response).to be_success
    end
    it 'create new project' do
      expect { post :create, params: valid_params }
        .to change { Project.count }.by(1)
    end
  end

  describe 'PATCH #update' do
    let(:valid_params) { { id: @project.id, project: attributes_for(:project, title: 'Update title', user: user) } }

    it 'returns a successful 200 response' do
      put :update, params: valid_params
      expect(response).to be_success
    end
   
    it 'updaet project' do
      expect { patch :update, params: valid_params }
        .to change { @project.reload.attributes }
    end
  end

  describe 'DELETE #destroy' do
    it 'return status 200' do
      delete :destroy, params: { id: @project.id }
      expect(response).to be_success
    end
    it 'updaet project' do
      expect { delete :destroy, params: { id: @project.id } }
        .to change { Project.count }.by(-1)
    end
  end  
end