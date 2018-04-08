class Comment < ApplicationRecord
  mount_uploader :attachment, AttachmentUploader
  belongs_to :task
  
  validates :title, length: { in: 3..255 }, presence: true
  validates :attachment, file_size: { less_than: 10.megabyte , message: 'An uploaded file is too large. The size shouldn’t exceed 10 MB.'}
end
