# encoding: utf-8
class Role
  attr_accessor :name
  attr_accessor :cut

  def self.collection(admin)
    if admin
      [
          Role.new(:name => 'Администратор', :cut => 0),
          Role.new(:name => 'Менеджер', :cut => 1),
          Role.new(:name => 'Агент', :cut => 2),
          Role.new(:name => 'Пользователь', :cut => 3)
      ]
    else
      [
          Role.new(:name => 'Агент', :cut => 2),
          Role.new(:name => 'Пользователь', :cut => 3)
      ]
    end
  end

  def self.collection_all
    [
        Role.new(:name => 'Администратор', :cut => 0),
        Role.new(:name => 'Менеджер', :cut => 1),
        Role.new(:name => 'Агент', :cut => 2),
        Role.new(:name => 'Пользователь', :cut => 3)
    ]
  end

  def initialize(hash)
    self.name = hash[:name]
    self.cut = hash[:cut]
  end

  def self.by_id(id)
    collection_all.each do |value|
      return value.name if value.cut == id
    end
    "Не установлена"
  end

end