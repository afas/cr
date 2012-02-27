class SearchController < ApplicationController

  def index
    #params = validateAndGet("flat_rooms_count", params);
    #params = validateAndGet("flat_rent_period", params);
    #params = validateAndGet("flat_prepayment", params);
    #params = validateAndGet("metro", params);
    #params = validateAndGet("address", params);
    #params = validateAndGet("flat_balkon", params);
    #params = validateAndGet("living_space", params);


    #t.integer  ""
    #t.integer  ""
    #t.integer  "rent_type"
    #t.float    "price"
    #t.integer  "prepayment"
    #t.string   "metro"
    #t.string   "address"
    #t.integer  "remote_type"
    #t.integer  "remote_time"
    #t.integer  "balkon"
    #t.float    "living_space"
    #t.integer  "floor"
    #t.integer  "floor_count"
    #t.text     "description"
    #t.boolean  "approved",     :default => false
    #t.float    "latitude"
    #t.float    "longitude"
    #t.boolean  "gmaps"
    #t.datetime "created_at"
    #t.datetime "updated_at"
    #t.integer  "agent_id"


    where = ""

    if (params[:flat_rooms_count])
      where += (where != "" ? " AND rooms_count = #{params[:flat_rooms_count]}" : "rooms_count = #{params[:flat_rooms_count]}")
    end

    if (params[:flat_rent_period])
      where += (where != "" ? " AND rent_period = #{params[:flat_rent_period]}" : "rent_period = #{params[:flat_rent_period]}")
    end

    if (params[:flat_prepayment])
      where += (where != "" ? " AND prepayment = #{params[:flat_prepayment]}" : "prepayment = #{params[:flat_prepayment]}")
    end

    #if (params[:metro])
    #  where += (where != "" ? " AND metro = #{params[:metro]}" : "metro = #{params[:metro]}")
    #end

    #if (params[:address])
    #  where += (where != "" ? " AND address = #{params[:address]}" : "address = #{params[:address]}")
    #end

    if (params[:flat_balkon])
      where += (where != "" ? " AND balkon = #{params[:flat_balkon]}" : "balkon = #{params[:flat_balkon]}")
    end

    if (params[:living_space])
      where += (where != "" ? " AND living_space = #{params[:living_space]}" : "living_space = #{params[:living_space]}")
    end

    if (params[:price_from])
      where += (where != "" ? " AND price >= #{params[:price_from]}" : "price >= #{params[:price_from]}")
    end

    if (params[:price_to])
      where += (where != "" ? " AND price <= #{params[:price_to]}" : "price <= #{params[:price_to]}")
    end


    if user_signed_in?
      where != "" ? @flats = Flat.approved.where(where).to_gmaps4rails : Flat.approved.to_gmaps4rails
    else
      @flats = Flat.all.to_gmaps4rails
    end

    respond_to do |format|
      format.html { render :layout => "with_gmaps" }
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