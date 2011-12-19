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
      if i > 0 && row[2]
        address = row[0]
        price = row[5]
        rooms_count = row[4]
        Flat.create(:address => address, :price => price, :rooms_count => rooms_count)
      end
    end
  end


end
