describe TaskSerializer, type: [:serializer] do
  let(:task) { create(:task) }
  let(:serializer) { described_class.new(task) }

  subject { JSON.parse(serializer.object.to_json) }

  it 'has attributes' do
    expect(subject['title']).to eq task.title
    expect(subject['done']).to eq task.done
    expect(subject['deadline']).to eq nil
  end
end