class CommentSerializer < ActiveModel::Serializer
  attributes :id, :title, :attachment, :created_at
end