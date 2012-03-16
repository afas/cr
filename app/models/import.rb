# encoding: utf-8
class Import < ActiveRecord::Base
  require 'spreadsheet'

  has_attached_file :file, :url => '/import/:id/:basename.:extension'
  validates_attachment_presence :file
  validates_attachment_content_type :file, :content_type => ['application/xls', 'application/vnd.ms-excel'], :message => "Неверный формат файла импорта."

  def import
    Spreadsheet.client_encoding = 'UTF-8'
    @workbook = Spreadsheet.open "#{Dir.getwd}/public/#{file.url.split('?').first}"

    @workbook.worksheets[0].each_with_index do |row, i|
      if i > 0

        address = row[4]
        metro = row[5]
        remote_time = row[6]
        rooms_count = row[8]
        floor = row[18]
        floor_count = row[19]
        description = "#{row[38]} #{row[36]}<br/>#{row[6]} минут #{row[7]}(выставь значение в селекторе выше)<br/>Мебель #{row[28]}"

        Flat.create(
            :address => address,
            :metro => metro,
            :rooms_count => rooms_count,
            :remote_time => remote_time,
            :floor => floor,
            :floor_count => floor_count,
            :description => description
        )

        #rent_period
        #rent_type
        #prepayment
        #remote_type
        #living_space
        #balkon
        #price = row[5]

        #   t.integer  "rooms_count"
#   t.integer  "rent_period"
#   t.integer  "rent_type"
#   t.float    "price"
#   t.integer  "prepayment"
#   t.string   "metro"
#   t.string   "address"
#   t.integer  "remote_type"
#   t.integer  "remote_time"
#   t.integer  "balkon"
#   t.float    "living_space"
#   t.integer  "floor"
#   t.integer  "floor_count"
#   t.text     "description"
#   t.boolean  "approved",     :default => false
#   t.float    "latitude"
#   t.float    "longitude"
#   t.boolean  "gmaps"
#   t.datetime "created_at"
#   t.datetime "updated_at"
#   t.integer  "agent_id"
      end
    end
  end
end
