class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :build_menu

  private

  def build_menu
    @about_menu = Static.find_all_by_menu("about")
    @services_menu = Static.find_all_by_menu("services")
    #@address = Static.where( :type => "address")

    if controller_name == "registrations"
      @flats_history = Flat.order("updated_at desc")
    end

  end

end
