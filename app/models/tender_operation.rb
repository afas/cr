# encoding: utf-8
class TenderOperation
  attr_accessor :name
  attr_accessor :cut

  def self.collection
    [
        TenderOperation.new(:name => 'Сдать', :cut => '0'),
        TenderOperation.new(:name => 'Снять', :cut => '1'),
        TenderOperation.new(:name => 'Купить', :cut => '2'),
        TenderOperation.new(:name => 'Продать', :cut => '3')
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