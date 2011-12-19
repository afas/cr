class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :build_menu

  private

  def build_menu
    @about_menu = Static.find_all_by_menu("about")
    @services_menu = Static.find_all_by_menu("services")
    #@address = Static.where( :type => "address")
  end

end
