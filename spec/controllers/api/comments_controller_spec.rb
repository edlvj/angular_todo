RSpec.describe Api::CommentsController, type: :controller do
  let(:user) { create :user }
  let(:project) { create :project, user: user }
  let(:task) { create :task, :with_comments, project: project }

  before do
    @comment = task.comments.first
    @new_comment = create :comment
    sign_in user
    request.headers.merge!(user.create_new_auth_token)
  end
  
  describe 'POST #create' do
    let(:valid_params) do
      { comment: attributes_for(:comment, task_id: task.id) }
    end
    
    it 'returns a successful 200 response' do
      post :create, params: valid_params
      expect(response).to be_success
    end
    
    it 'create new comment' do
      expect { post :create, params: valid_params }
        .to change { Comment.count }.by(1)
    end
  end
  
  describe 'DELETE #destroy' do
    it 'returns a successful 200 response' do
      delete :destroy, params: { id: @comment.id }
      expect(response).to be_success
    end
    it 'destroy comment' do
      expect { delete :destroy, params: { id: @comment.id } }
        .to change { Comment.count }.by(-1)
    end
  end
end