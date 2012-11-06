# encoding: utf-8
class Import < ActiveRecord::Base
  require 'spreadsheet'

  has_many :flats

  has_attached_file :file, :url => '/import/:id/:basename.:extension'
  validates_attachment_presence :file
  validates_attachment_content_type :file, :content_type => ['application/xls', 'application/vnd.ms-excel'], :message => "Неверный формат файла импорта."

  before_destroy :remove_flats

  def import
    Spreadsheet.client_encoding = 'UTF-8'
    @workbook = Spreadsheet.open "#{Dir.getwd}/public/#{file.url.split('?').first}"

    @workbook.worksheets[0].each_with_index do |row, i|
      if i > 0
        city = "Москва"

        street = row[4]
        address = "#{city}, #{street}"
        metro = row[5]
        remote_time = row[6].to_i
        remote_type = RemoteType.by_code(row[7])
        rooms_count = row[8].to_i
        floor = row[18].to_i
        floor_count = row[19].to_i
        kitch_space = row[11].to_i
        full_space = row[9].to_i

        rur = row[14] if row[15] == "р"
        usd = row[14] if row[15] == "$"

        description = "Мебель: #{row[28]}"
        internal_comments = "TEL: #{row[35]}, PHONE1: #{row[36]}, PHONE2: #{row[37]}, HOST: #{row[38]}"

        import_id = self.id

        Flat.create(
            :street => street,
            :address => address,
            :metro => metro,
            :rooms_count => rooms_count,
            :remote_time => remote_time,
            :remote_type => remote_type,
            :kitch_space => kitch_space,
            :full_space => full_space,
            :floor => floor,
            :floor_count => floor_count,
            :rur => rur,
            :usd => usd,
            :description => description,
            :internal_comments => internal_comments,
            :import_id => import_id
        )
      end
    end
  end


  private

  def remove_flats
    self.flats.destroy_all
  end

end
