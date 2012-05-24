# encoding: utf-8
class ClientStatus
  attr_accessor :name
  attr_accessor :cut

  def self.collection
    [
        ClientStatus.new(:name => 'Просматриваю варианты (подписка)', :cut => 0),
        ClientStatus.new(:name => 'В поиске помещения', :cut => 1),
        ClientStatus.new(:name => 'В поиске арендатора', :cut => 2),
        ClientStatus.new(:name => 'Архив', :cut => 3)
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