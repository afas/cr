class Tender < ActiveRecord::Base
  validates_presence_of :name, :phone

  belongs_to :agent, :class_name => "User"


end
