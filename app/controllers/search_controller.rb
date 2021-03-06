class SearchController < ApplicationController

  def index

    conditions = ""

    if (params[:flat_rooms_count] && params[:flat_rooms_count] != '')
      conditions += (conditions != "" ? " AND rooms_count = #{params[:flat_rooms_count]}" : "rooms_count = #{params[:flat_rooms_count]}")
    end

    if (params[:flat_rent_period])
      conditions += (conditions != "" ? " AND rent_period = #{params[:flat_rent_period]}" : "rent_period = #{params[:flat_rent_period]}")
    end

    if (params[:flat_prepayment])
      conditions += (conditions != "" ? " AND prepayment = #{params[:flat_prepayment]}" : "prepayment = #{params[:flat_prepayment]}")
    end

    if (params[:metro] && params[:metro] != '')
      conditions += (conditions != "" ? " AND metro = '#{params[:metro]}'" : "metro = '#{params[:metro]}'")
    end

    if (params[:address])
      conditions += (conditions != "" ? " AND street = '#{params[:address]}'" : "street = '#{params[:address]}'")
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

    if (params[:price] && params[:price] != '')
      conditions += (conditions != "" ? " AND price > #{params[:price].to_f * 0.8} AND price < #{params[:price].to_f * 1.3}" : "price > #{params[:price].to_f * 0.8} AND price < #{params[:price].to_f * 1.3}")
    end

    if !current_user.nil? && (current_user.manager?)
      @flats = conditions != "" ? Flat.where(conditions).to_gmaps4rails : Flat.all.to_gmaps4rails
    else
      if !current_user.nil?
        @flats = conditions != "" ? Flat.where(conditions).where("approved = ? || agent_id = ?", true, current_user.id).to_gmaps4rails : Flat.where("approved = ? || agent_id = ?", true, current_user.id).to_gmaps4rails
      else
        @flats = conditions != "" ? Flat.approved.where(conditions).to_gmaps4rails : Flat.approved.to_gmaps4rails
      end
    end

    respond_to do |format|
      format.html { render :layout => "with_gmaps_fs" }
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