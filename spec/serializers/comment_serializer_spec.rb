describe CommentSerializer, type: [:serializer] do
  let(:comment) { create(:comment, :with_img_attachment) }
  let(:serializer) { described_class.new(comment) }

  subject { JSON.parse(serializer.object.to_json) }

  it 'has attributes' do
    expect(subject['id']).to eq comment.id
    expect(subject['title']).to eq comment.title
    expect(subject['attachment']).to eq({ "url" => comment.attachment.url })
  end
end
