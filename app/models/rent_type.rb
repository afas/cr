# encoding: utf-8
class RentType
  attr_accessor :name
  attr_accessor :cut

  def self.collection
    [
        RentType.new(:name => 'Любой срок', :cut => '0'),
        RentType.new(:name => 'Посуточная', :cut => '1'),
        RentType.new(:name => 'Сезонная сдача(несколько месяцев)', :cut => '2'),
        RentType.new(:name => 'Длительный срок(от года)', :cut => '3'),
        RentType.new(:name => 'От месяца и более', :cut => '4'),
    ]
  end

  def initialize(hash)
    self.name = hash[:name]
    self.cut = hash[:cut]
  end

end