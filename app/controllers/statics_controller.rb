class StaticsController < ApplicationController
  load_and_authorize_resource

  # GET /statics
  # GET /statics.xml
  def index
    respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @statics }
    end
  end

  # GET /statics
  # GET /statics.xml
  def special
    @specials = Static.find_all_by_menu("special")
    respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @statics }
    end
  end

  # GET /statics/1
  # GET /statics/1.xml
  def show
    @static = Static.find_by_short_url(params[:short_url]) if params[:short_url]
    if @static.short_url == "about" || @static.short_url == "services" || @static.short_url == "vacancies" || @static.short_url == "why" || @static.short_url == "feedback" || @static.short_url == "faq"
      render :action => "with-adwert"
    else
      respond_to do |format|
        format.html # show.html.erb
        format.xml { render :xml => @static }
      end
    end

  end

  # GET /statics/new
  # GET /statics/new.xml
  def new
    @static.menu = params[:menu] if params[:menu]
    respond_to do |format|
      format.html # new.html.erb
      format.xml { render :xml => @static }
    end
  end

  # GET /statics/1/edit
  def edit
    render :layout => "with_aloha"
  end

  # POST /statics
  # POST /statics.xml
  def create
    respond_to do |format|
      if @static.save
        format.html { redirect_to(@static,
                                  :notice => I18n.t('backend.actions.success_create',
                                                    :model => I18n.t('activerecord.capitalized_models.static'))) }
        format.xml { render :xml => @static, :status => :created, :location => @static }
      else
        format.html { render :action => "new" }
        format.xml { render :xml => @static.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /statics/1
  # PUT /statics/1.xml
  def update
    respond_to do |format|
      if @static.update_attributes(params[:static])
        format.html { redirect_to(@static,
                                  :notice => I18n.t('backend.actions.success_update',
                                                    :model => I18n.t('activerecord.capitalized_models.static'))) }
        format.xml { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml { render :xml => @static.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /statics/1
  # DELETE /statics/1.xml
  def destroy
    @static.destroy

    respond_to do |format|
      format.html { redirect_to(statics_url,
                                :notice => I18n.t('backend.actions.success_destroy',
                                                  :model => I18n.t('activerecord.capitalized_models.static'))) }
      format.xml { head :ok }
    end
  end
end
