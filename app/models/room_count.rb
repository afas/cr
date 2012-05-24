# encoding: utf-8
class RoomCount
  attr_accessor :name
  attr_accessor :cut

  def self.collection
    [
        RoomCount.new(:name => 'комната', :cut => '0'),
        RoomCount.new(:name => '1', :cut => '1'),
        RoomCount.new(:name => '2', :cut => '2'),
        RoomCount.new(:name => '3', :cut => '3'),
        RoomCount.new(:name => '4', :cut => '4'),
        RoomCount.new(:name => '5', :cut => '5'),
        RoomCount.new(:name => 'более', :cut => '6')
    ]
  end

  def initialize(hash)
    self.name = hash[:name]
    self.cut = hash[:cut]
  end

  def self.by_id(id)
    collection.each do |value|
      return value.name if value.cut.to_i == id
    end
    false
  end


end