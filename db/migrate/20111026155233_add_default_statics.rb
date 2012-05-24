# encoding: utf-8
class AddDefaultStatics < ActiveRecord::Migration
  def up
    Static.create(:title => "О нас", :short_url => "about", :menu => "about")
    Static.create(:title => "Услуги", :short_url => "services", :menu => "about")
    Static.create(:title => "Вакансии", :short_url => "vacancies", :menu => "about")
    Static.create(:title => "Отзыв", :short_url => "feedback", :menu => "about")

    Static.create(:title => "Почему мы", :short_url => "why", :menu => "services")
    Static.create(:title => "Документы", :short_url => "docs", :menu => "services")
    Static.create(:title => "Страхование", :short_url => "insurance", :menu => "services")
    Static.create(:title => "Город", :short_url => "city", :menu => "services")
    Static.create(:title => "FAQ", :short_url => "faq", :menu => "services")

    Static.create(:title => "Адрес", :short_url => "address", :menu => "address")

    Static.create(:title => "Акция1", :short_url => "superspecial1", :menu => "special")
    Static.create(:title => "Акция2", :short_url => "superspecial2", :menu => "special")

    #Static.create(:title => "Команда", :short_url => "team", :menu => "services")
    #Static.create(:title => "Страхованиеи", :short_url => "insurance", :menu => "services", :parent_id => 7)
    #Static.create(:title => "3D фото", :short_url => "3d-photo", :menu => "services", :parent_id => 7)
    #Static.create(:title => "Достопримечательности", :short_url => "attraction", :menu => "services", :parent_id => 10)
    #Static.create(:title => "Благотворительность", :short_url => "charity", :menu => "services")
  end

  def down
  end
end
