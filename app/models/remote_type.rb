# encoding: utf-8
class RemoteType
  attr_accessor :name
  attr_accessor :cut
  attr_accessor :code

  def self.collection
    [
        RemoteType.new(:name => 'Пешком', :cut => 0, :code => "п"),
        RemoteType.new(:name => 'Общественным транспортом', :cut => 1, :code => "т")
    ]
  end

  def initialize(hash)
    self.name = hash[:name]
    self.cut = hash[:cut]
    self.code = hash[:code]
  end

  def self.by_id(id)
    collection.each do |value|
      return value.name if value.cut == id
    end
    false
  end

  def self.by_code(code)
    collection.each do |value|
      return value.cut if value.code == code
    end
    false
  end

end