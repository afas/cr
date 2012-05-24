#encoding:utf-8
class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :build_menu

  private

  #def after_sign_in_path_for(resource)
  #  if current_user.name.blank? || current_user.phone.blank?
  #    redirect_to edit_user_registration, :notice => "Для большего комфорта работы системы предлагаем вам назвать ваше имя и контактный телефон."
    #else
    #  redirect_to
    #  true
    #end
  #end

  def build_menu
    @about_menu = Static.find_all_by_menu("about")
    @services_menu = Static.find_all_by_menu("services")
    #@address = Static.where( :type => "address")

    if controller_name == "registrations"
      if !current_user.nil? && (current_user.manager?)
        @flats = Flat.order("updated_at desc")
        @tenders = Tender.where("client_status_id <> ?", 3).order("updated_at desc")
      else
        if current_user.nil?
          @flats = Flat.approved.order("updated_at desc")
        else
          @flats = Flat.where("agent_id = ?", current_user.id).order("updated_at desc")
          @tenders = Tender.where("agent_id = ? && client_status_id <> ?", current_user.id, 3).order("updated_at desc")
        end
      end
    end
  end
end
