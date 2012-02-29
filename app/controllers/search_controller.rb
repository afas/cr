class SearchController < ApplicationController

  def index

    conditions = ""

    if (params[:flat_rooms_count])
      conditions += (conditions != "" ? " AND rooms_count = #{params[:flat_rooms_count]}" : "rooms_count = #{params[:flat_rooms_count]}")
    end

    if (params[:flat_rent_period])
      conditions += (conditions != "" ? " AND rent_period = #{params[:flat_rent_period]}" : "rent_period = #{params[:flat_rent_period]}")
    end

    if (params[:flat_prepayment])
      conditions += (conditions != "" ? " AND prepayment = #{params[:flat_prepayment]}" : "prepayment = #{params[:flat_prepayment]}")
    end

    if (params[:metro])
      conditions += (conditions != "" ? " AND metro = '#{params[:metro]}'" : "metro = '#{params[:metro]}'")
    end

    if (params[:address])
      conditions += (conditions != "" ? " AND address = '#{params[:address]}'" : "address = '#{params[:address]}'")
    end

    if (params[:flat_balkon])
      conditions += (conditions != "" ? " AND balkon = #{params[:flat_balkon]}" : "balkon = #{params[:flat_balkon]}")
    end

    if (params[:living_space])
      conditions += (conditions != "" ? " AND living_space = #{params[:living_space]}" : "living_space = #{params[:living_space]}")
    end

    if (params[:price_from])
      conditions += (conditions != "" ? " AND price >= #{params[:price_from]}" : "price >= #{params[:price_from]}")
    end

    if (params[:price_to])
      conditions += (conditions != "" ? " AND price <= #{params[:price_to]}" : "price <= #{params[:price_to]}")
    end

    if (params[:price_to])
      conditions += (conditions != "" ? " AND price <= #{params[:price_to]}" : "price <= #{params[:price_to]}")
    end

    if user_signed_in?
      @flats = conditions != "" ? Flat.where(conditions).to_gmaps4rails : Flat.all.to_gmaps4rails
    else
      @flats = conditions != "" ? Flat.approved.where(conditions).to_gmaps4rails : Flat.approved.to_gmaps4rails
    end

    respond_to do |format|
      format.html { render :layout => "with_gmaps" }
      format.json do
        #@data = @flats.collect do |f|
        #  {
        #      :lng => f.longitude,
        #      :lat => f.latitude,
        #      :description => f.gmaps4rails_infowindow
        #      #:picture => f.marker_picture,
        #      #:title => f.marker_title
        #  }
        #end
        render :json => @flats
      end
    end
  end

end