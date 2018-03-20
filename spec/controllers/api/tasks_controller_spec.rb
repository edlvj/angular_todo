RSpec.describe Api::TasksController, type: :controller do
  let(:user) { create :user }
  let(:project) {create :project, :with_tasks, user: user }
  
  before do
    @task = project.tasks.first
    sign_in user
    request.headers.merge!(user.create_new_auth_token)
  end
  
  describe 'POST #create' do
    let(:valid_params) do
      { task: attributes_for(:task, project_id: project.id) }
    end

    it 'returns a successful 200 response' do
      post :create, params: valid_params
      expect(response).to be_success
    end
    it 'create new task' do
      expect { post :create, params: valid_params }
        .to change { Task.count }.by(1)
    end
  end
  
  describe 'DELETE #destroy' do
    it 'returns a successful 200 response' do
      delete :destroy, params: { id: @task.id }
      expect(response).to be_success
    end
    it 'destroy task' do
      expect { delete :destroy, params: { id: @task.id } }
        .to change { Task.count }.by(-1)
    end
  end  
end  