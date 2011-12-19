# encoding: utf-8
class Balkon
  attr_accessor :name
  attr_accessor :cut

  def self.collection
    [
        Balkon.new(:name => 'Не важно', :cut => '0'),
        Balkon.new(:name => 'Без балкона', :cut => '1'),
        Balkon.new(:name => 'Лоджея', :cut => '2'),
        Balkon.new(:name => '1', :cut => '3'),
        Balkon.new(:name => '2', :cut => '4'),
        Balkon.new(:name => '3', :cut => '5'),
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