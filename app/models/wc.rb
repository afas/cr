# encoding: utf-8
class WC
  attr_accessor :name
  attr_accessor :cut

  def self.collection
    [
        RentPeriod.new(:name => 'Совмещенный', :cut => '1'),
        RentPeriod.new(:name => 'Раздельный', :cut => '2'),
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