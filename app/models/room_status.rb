# encoding: utf-8
class RoomStatus
  attr_accessor :name
  attr_accessor :cut

  def self.collection
    [
        RoomStatus.new(:name => 'Подана, к рассмотрению', :cut => 0),
        RoomStatus.new(:name => 'Рассмотрена, допущена к поиску', :cut => 1),
        RoomStatus.new(:name => 'Сдана, архив', :cut => 2)
    ]
  end

  def initialize(hash)
    self.name = hash[:name]
    self.cut = hash[:cut]
  end

  def self.by_id(id)
    collection.each do |value|
      return value.name if value.cut == id
    end
    false
  end

end