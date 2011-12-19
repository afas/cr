class MetrosController < ApplicationController
  load_and_authorize_resource

  def by_metro
    @tags = Metro.where("UPPER(name) like UPPER('#{params[:term]}%') OR UPPER(name) like UPPER('%#{params[:term]}%')")
    @results = Array.new
    @tags.each do |t|
      @results << {:id => t.id, :value => t.name, :object => t.class.to_s}
    end

    respond_to do |format|
      format.json { render :json => @results }
    end
  end


  # GET /metros
  # GET /metros.xml
  def index
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @metros }
    end
  end

  # GET /metros/1
  # GET /metros/1.xml
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @metro }
    end
  end

  # GET /metros/new
  # GET /metros/new.xml
  def new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @metro }
    end
  end

  # GET /metros/1/edit
  def edit
  end

  # POST /metros
  # POST /metros.xml
  def create
    respond_to do |format|
      if @metro.save
        format.html { redirect_to(@metro,
                                  :notice => I18n.t('backend.actions.success_create',
                                                    :model => I18n.t('activerecord.capitalized_models.metro'))) }
        format.xml  { render :xml => @metro, :status => :created, :location => @metro }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @metro.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /metros/1
  # PUT /metros/1.xml
  def update
    respond_to do |format|
      if @metro.update_attributes(params[:metro])
        format.html { redirect_to(@metro,
                                  :notice => I18n.t('backend.actions.success_update',
                                                    :model => I18n.t('activerecord.capitalized_models.metro'))) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @metro.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /metros/1
  # DELETE /metros/1.xml
  def destroy
    @metro.destroy

    respond_to do |format|
      format.html { redirect_to(metros_url,
                                :notice => I18n.t('backend.actions.success_destroy',
                                                  :model => I18n.t('activerecord.capitalized_models.metro'))) }
      format.xml  { head :ok }
    end
  end
end
