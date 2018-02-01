class CommentSerializer < ActiveModel::Serializer
  attributes :id, :title, :attachment
end