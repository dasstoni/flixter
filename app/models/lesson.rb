class Lesson < ActiveRecord::Base
  belongs_to :section
  mount_uploader :video, VideoUploader
end
