# encoding: utf-8
class Prepayment
  attr_accessor :name
  attr_accessor :cut

  def self.collection
    [
        Prepayment.new(:name => 'Не имеет значение', :cut => '0'),
        Prepayment.new(:name => '1 месяц', :cut => '1'),
        Prepayment.new(:name => '2 месяца', :cut => '2'),
        Prepayment.new(:name => '6 месяцев', :cut => '3'),
        Prepayment.new(:name => 'год', :cut => '4'),
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