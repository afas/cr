# encoding: utf-8
class Flat < ActiveRecord::Base
  acts_as_gmappable :check_process => false
  has_many :flat_images

  default_scope order("id DESC")

  scope :approved, where(:approved => true)

  def flat_images=(flat_images_array)
    flat_images_array.each do |flat_image|
      self.flat_images << FlatImage.new(:image => flat_image)
    end
  end

  def gmaps4rails_address
    #"#{self.street}, #{self.city}, #{self.country}"
    "#{self.address}"
  end

  def gmaps4rails_infowindow
    img = self.flat_images.size > 0 ? "<img src='#{self.flat_images.first.image.url(:list)}'/><br/>" : ""

    "#{img}<b>Адрес:</b> #{self.address}<br/><b>Комнат:</b> #{self.rooms_count}<br/><b>Стоимость: </b>#{self.price}<br/><p class='baloon-right'><a href='/flats/#{self.id}'>Полная информация</a></p>"
    #link_to t('backend.actions.edit'), edit_room_path(@room)
    #link_to t('backend.actions.back'), rooms_path
  end

  #def gmaps4rails_marker_picture
  #  {
  #      "picture" => "/images/#{brand}.png",
  #      "width" => "43",
  #      "height" => "13"
  #"marker_anchor" => [5, 10],
  #"shadow_picture" => "/images/morgan.png",
  #"shadow_width" => "110",
  #"shadow_height" => "110",
  #"shadow_anchor" => [5, 10],
  #}
  #end


end