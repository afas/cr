# encoding: utf-8
class Metro < ActiveRecord::Base
  require 'spreadsheet'

  def self.import
    Spreadsheet.client_encoding = 'UTF-8'
    @workbook = Spreadsheet.open "#{Dir.getwd}/public/metro.xls"

    @workbook.worksheets[0].each_with_index do |row, i|
      if row[0]
        name = row[0]
        Metro.create(:name => name)
      end
    end
  end

end
