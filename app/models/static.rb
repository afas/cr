# encoding: utf-8
class Static < ActiveRecord::Base
  #belongs_to :static, :foreign_key => :parent_id
  #has_many :statics, :foreign_key => :parent_id
  has_many :static_images
  has_many :static_files

  has_attached_file :preview,
                    :styles => {
                        :list => '170x130#',
                        :special => '233x233#',
                        :inner => '350x200#'
                    },
                    :default_url => 'circle.png',
                    :url => '/static/:id/:style_:basename.:extension'

  #validates_attachment_presence :preview
  validates_attachment_content_type :preview, :content_type => ['image/jpeg', 'image/png'], :message => "Неверный формат файла изображения."

  def static_images=(static_images_array)
    static_images_array.each do |static_image|
      self.static_images << StaticImage.new(:image => static_image)
    end
  end

  def static_files=(static_files_array)
    static_files_array.each do |static_file|
      self.static_files << StaticFile.new(:file => static_file)
    end
  end
end