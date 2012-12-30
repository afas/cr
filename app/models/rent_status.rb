# encoding: utf-8
class RentStatus
  attr_accessor :name
  attr_accessor :cut

  def self.collection
    [
        RentStatus.new(:name => 'Подана, к рассмотрению', :cut => 0),
        RentStatus.new(:name => 'В работе', :cut => 1),
        RentStatus.new(:name => 'Сдана, архив', :cut => 2)
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