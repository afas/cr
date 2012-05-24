class WelcomeController < ApplicationController
  def index
    @specials = Static.find_all_by_menu("special")
    @backgrounds = WelcomeImage.all

  end
end
