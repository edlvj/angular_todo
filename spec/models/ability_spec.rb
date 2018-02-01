require 'cancan/matchers'

RSpec.describe Ability, type: :model do
  let(:user) { create :user }
  let(:project) { create :project, user: user }
  let(:task) { create :task, project: project }
  let(:comment) { create :comment, task: task }
  
  context 'when user signed in' do
    subject { Ability.new(user) }
   
    it { should be_able_to(:manage, project) }
    it { should be_able_to(:manage, task) }
  end
end