# encoding: utf-8
class RentPeriod
  attr_accessor :name
  attr_accessor :cut

  def self.collection
    [
        RentPeriod.new(:name => 'Почасовая', :cut => 0),
        RentPeriod.new(:name => 'Посуточная', :cut => 1),
        RentPeriod.new(:name => 'Сезонная сдача(несколько месяцев)', :cut => 2),
        RentPeriod.new(:name => 'Месяц и более', :cut => 3),
        RentPeriod.new(:name => 'Длительный срок(от года)', :cut => 4)
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