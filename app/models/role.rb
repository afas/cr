# encoding: utf-8
class Role
  attr_accessor :name
  attr_accessor :cut

  def self.collection
    [
        Role.new(:name => 'Администратор', :cut => '0'),
        Role.new(:name => 'Менеджер', :cut => '1'),
        Role.new(:name => 'Риэлтор', :cut => '2'),
        Role.new(:name => 'Пользователь', :cut => '3')
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