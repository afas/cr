# encoding: utf-8
class RemoteType
  attr_accessor :name
  attr_accessor :cut

  def self.collection
    [
        RemoteType.new(:name => 'Пешком', :cut => '0'),
        RemoteType.new(:name => 'Общественным транспортом', :cut => '1')
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