# encoding: utf-8
class FlatType
  attr_accessor :name
  attr_accessor :cut

  def self.collection
    [
        FlatType.new(:name => 'Жилье', :cut => '0'),
        FlatType.new(:name => 'Офис', :cut => '1')
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