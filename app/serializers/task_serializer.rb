class TaskSerializer < ActiveModel::Serializer
  attributes :id, :title, :done, :priority, :deadline
  has_many :comments , serializer: CommentSerializer
end