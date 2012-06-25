class WelcomeController < ApplicationController
  def index
    @specials = Static.where("menu = ?", 'special').order("random()")
    @backgrounds = WelcomeImage.all

  end
end
