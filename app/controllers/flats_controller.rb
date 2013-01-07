#encoding:utf-8
class FlatsController < ApplicationController
  load_and_authorize_resource

  #before_filter :auth_user, :only => "new"

  #def auth_user
  #  redirect_to new_user_registration_path, :notice => "Внимание! <br/>Для размещения информации о квартире необходимо зарегистрироваться" if current_user.nil?
  #end

  def by_street
    street_name = params[:term].mb_chars.titleize.to_s
    @tags = Flat.select("DISTINCT street").where("street LIKE '#{street_name}%'")
    @results = Array.new
    @tags.each do |t|
      @results << {:id => t.id, :value => t.street, :object => t.class.to_s}
    end

    respond_to do |format|
      format.json { render :json => @results }
    end
  end

  # GET /flats
  # GET /flats.xml
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

    order = "id DESC"
    if (params[:flat_flats_order])
      order = "#{params[:flat_flats_order]}"
    end

    if !current_user.nil? && (current_user.manager?)
      @flats = conditions != "" ? Flat.where(conditions) : Flat.all
    else
      if !current_user.nil?
        @flats = conditions != "" ? Flat.where(conditions).where("approved = ? || agent_id = ?", true, current_user.id) : Flat.where("approved = ? || agent_id = ?", true, current_user.id)
      else
        @flats = conditions != "" ? Flat.approved.where(conditions) : Flat.approved
      end
    end

    #if !current_user.nil? && (current_user.manager?)
    #  @flats = conditions != "" ? Flat.where(conditions) : Flat.all
    #else
    #  @flats = conditions != "" ? Flat.approved.where(conditions) : Flat.approved
    #end

    respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @flats }
    end
  end

  # GET /flats/1
  # GET /flats/1.xml
  def show
    @flats_to_map = Flat.where("id = ?", params[:id]).to_gmaps4rails

    respond_to do |format|
      format.html { render :layout => "with_gmaps" }
      format.xml { render :xml => @flat }
    end
  end

  # GET /flats/new
  # GET /flats/new.xml
  def new
    respond_to do |format|
      format.html
      format.xml { render :xml => @flat }
    end
  end

  # GET /flats/1/edit
  def edit
  end

  # POST /flats
  # POST /flats.xml
  def create
    respond_to do |format|
      if @flat.save
        format.html { redirect_to(@flat,
                                  :notice => I18n.t('backend.actions.success_create',
                                                    :model => I18n.t('activerecord.capitalized_models.flat'))) }
        format.xml { render :xml => @flat, :status => :created, :location => @flat }
      else
        format.html { render :action => "new" }
        format.xml { render :xml => @flat.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /flats/1
  # PUT /flats/1.xml
  def update
    respond_to do |format|
      if @flat.update_attributes(params[:flat])
        format.html { redirect_to(@flat,
                                  :notice => I18n.t('backend.actions.success_update',
                                                    :model => I18n.t('activerecord.capitalized_models.flat'))) }
        format.xml { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml { render :xml => @flat.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /flats/1
  # DELETE /flats/1.xml
  def destroy
    @flat.destroy

    respond_to do |format|
      format.html { redirect_to(flats_url,
                                :notice => I18n.t('backend.actions.success_destroy',
                                                  :model => I18n.t('activerecord.capitalized_models.flat'))) }
      format.xml { head :ok }
    end
  end
end
