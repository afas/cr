class WelcomeController < ApplicationController
  def index
    @specials = Static.where("menu = ?", 'special').order("random()")
    @backgrounds = WelcomeImage.order("created_at desc")
  end
end