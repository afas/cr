class Tender < ActiveRecord::Base
  validates_presence_of :name, :phone, :operation
end
