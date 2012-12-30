# encoding: utf-8
class Flat < ActiveRecord::Base

  acts_as_gmappable :check_process => true

  has_many :flat_images

  belongs_to :agent, :class_name => "User"
  #, :foreign_key => :agent_id

  belongs_to :import

  #default_scope order("id DESC")

  scope :approved, where(:approved => true)

  def flat_images=(flat_images_array)
    flat_images_array.each do |flat_image|
      self.flat_images << FlatImage.new(:image => flat_image)
    end
  end

  def gmaps4rails_address
    "#{self.country}, #{self.region}, город #{self.city}, #{self.district}, улица #{self.street}, #{self.building}"
  end

  def small_address
    "#{self.city}, #{self.district}, #{self.street}, #{self.building}"
  end

  def small_address
    self.address
  end

  def gmaps4rails_infowindow
    img = self.flat_images.size > 0 ? "<img src='#{self.flat_images.first.image.url(:list)}'/><br/>" : ""
    "#{img}<b>Адрес:</b> #{small_address}<br/><b>Комнат:</b> #{self.rooms_count}<br/><b>Стоимость: </b>#{self.price}<br/><p class='baloon-right'><a href='/flats/#{self.id}'>Полная информация</a></p>"
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