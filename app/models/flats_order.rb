# encoding: utf-8
class FlatsOrder
  attr_accessor :name
  attr_accessor :cut

  def self.collection
    [
        FlatsOrder.new(:name => 'Цена', :cut => 'price'),
        FlatsOrder.new(:name => 'Удаленность от метро', :cut => 'remote_time'),
        FlatsOrder.new(:name => 'Жилая площадь', :cut => 'living_space'),
        FlatsOrder.new(:name => 'Добавлена', :cut => 'updatet_at DESC')
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