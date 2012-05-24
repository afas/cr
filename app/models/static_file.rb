class StaticFile < ActiveRecord::Base
  has_attached_file :file, :url => '/static_files/:id/:basename.:extension'
end
