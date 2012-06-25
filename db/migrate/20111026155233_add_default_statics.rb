# encoding: utf-8
class AddDefaultStatics < ActiveRecord::Migration
  def up
    Static.create(:title => "Адрес", :hover => "офиса", :content => '<p><b>Телефон:</b> <i>+7 (499) 75 57 303 (круглосуточно)</i></p><p><b>EMail:</b> <a href="mailto:mail@classicrent.ru">mail@classicrent.ru</a></p><p class="skype"><b>Скайп:</b> <script type="text/javascript" src="http://download.skype.com/share/skypebuttons/js/skypeCheck.js"></script><a href="skype:support.classicrent?call"><img src="http://download.skype.com/share/skypebuttons/buttons/call_blue_transparent_34x34.png" alt="Skype Me™!"></a><i>support.classicrent</i></p><p><b>Почтовый адрес:</b> <i>127473, Москва, ул. Селезневская, д.4, офис 12;</i><br/><iframe src="https://maps.google.com/maps?client=ubuntu&amp;channel=fs&amp;oe=utf-8&amp;q=127473,+%D0%9C%D0%BE%D1%81%D0%BA%D0%B2%D0%B0,+%D1%83%D0%BB.+%D0%A1%D0%B5%D0%BB%D0%B5%D0%B7%D0%BD%D0%B5%D0%B2%D1%81%D0%BA%D0%B0%D1%8F,+%D0%B4.4,+%D0%BE%D1%84%D0%B8%D1%81+12&amp;ie=UTF8&amp;hq=&amp;hnear=%D0%A1%D0%B5%D0%BB%D0%B5%D0%B7%D0%BD%D0%B5%D0%B2%D1%81%D0%BA%D0%B0%D1%8F+%D1%83%D0%BB.,+4,+%D0%9C%D0%BE%D1%81%D0%BA%D0%B2%D0%B0,+%D0%A0%D0%BE%D1%81%D1%81%D0%B8%D1%8F,+127473&amp;t=m&amp;ll=55.781135,37.603562&amp;spn=0.00362,0.020578&amp;z=16&amp;iwloc=A&amp;output=embed" marginwidth="0" marginheight="0" frameborder="0" height="300" scrolling="no" width="960"></iframe></p>', :short_url => "address", :menu => "about")
    Static.create(:title => "О проекте", :hover => "суперцель", :content => "<p></p>", :short_url => "about", :menu => "about")
    Static.create(:title => "Работа", :hover => "в команде", :short_url => "job", :menu => "about")
    Static.create(:title => "Партнеры", :hover => "по развитию", :short_url => "partners", :menu => "about")
    Static.create(:title => "Город", :hover => "", :short_url => "city", :menu => "about")


    Static.create(:title => "Снять", :hover => "+параметры помещений", :short_url => "for_renter", :menu => "services")
    Static.create(:title => "Сдать", :hover => "порядок действий", :short_url => "for_owner", :menu => "services")
    Static.create(:title => "Документы", :hover => "для оформления сделок", :short_url => "documents", :menu => "services")
    Static.create(:title => "Услуги", :hover => "эксклюзив", :short_url => "services", :menu => "services")
    Static.create(:title => "Отзывы", :hover => "сообщество", :short_url => "feedback", :menu => "services")

    Static.create(:title => "Страхование квартир", :short_url => "apartment insurance", :menu => "special")
    Static.create(:title => "Помощь при переезде", :short_url => "help_with_moving", :menu => "special")
    Static.create(:title => "Ремонтные работы как этап подготовки квартиры к сдаче", :short_url => "repair_of_apartments", :menu => "special")
    Static.create(:title => "Юридическое сопровождение сделок в течение всего периода договора.", :short_url => "legal_support_of_transactions", :menu => "special")
    Static.create(:title => "Панорамная съемка / 3D тур", :short_url => "panoramic_photography", :menu => "special")
  end

  def down
  end
end