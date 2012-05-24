class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :build_menu

  private

  def build_menu
    @about_menu = Static.find_all_by_menu("about")
    @services_menu = Static.find_all_by_menu("services")
    #@address = Static.where( :type => "address")

    if controller_name == "registrations"
      if !current_user.nil? && (current_user.manager?)
        @flats = Flat.order("updated_at desc")
      else
        if current_user.nil?
          @flats = Flat.approved.order("updated_at desc")
        else
          @flats = Flat.where("agent_id = ?", current_user.id).order("updated_at desc")
        end
      end
    end
  end
end
