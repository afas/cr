class SearchController < ApplicationController

  def index
    if (params[:flat_rooms_count])
      @flats = Flat.where("rooms_count = #{params[:flat_rooms_count]}")
    else
      if user_signed_in?
        @flats = Flat.all.to_gmaps4rails
      else
        @flats = Flat.approved.to_gmaps4rails
      end
    end

    respond_to do |format|
      format.html { render :layout => "with_gmaps"}
      format.json do
        @data = @flats.collect do |f|
          {
              :lng => f.longitude,
              :lat => f.latitude,
              :description => f.gmaps4rails_infowindow
              #:picture => f.marker_picture,
              #:title => f.marker_title
          }
        end
        render :json => @data
      end
    end
  end
end