class SourcesController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :create, :edit, :update]
  # GET /sources
  # GET /sources.json
  def index

    if params[:tag]
      @sources = Source.tagged_with(params[:tag])
    elsif params[:srchquery]
      @sources = Source.search_by_basic(params[:srchquery])
    else
      @sources = Source.all
    end




    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sources }
    end
  end

  # GET /sources/1
  # GET /sources/1.json
  def show
    @source = Source.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @source }
    end
  end

  # GET /sources/new
  # GET /sources/new.json
  def new
    @source = Source.new

    @source.usedmethods.build
    @deliverymethods = Deliverymethod.find(:all,:order => "dmcod")

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @source }
    end
  end

  # GET /sources/1/edit
  def edit
    @source = Source.find(params[:id])

    @source.usedmethods.build
    @deliverymethods = Deliverymethod.find(:all,:order => "dmcod")
    @usedmethods = @source.usedmethods
  end

  # POST /sources
  # POST /sources.json
  def create
#    current_user.created_source = Source.new
    @source = current_user.sources.new(params[:source])
    #@source = Source.new(params[:source])

    respond_to do |format|
      if @source.save
        format.html { redirect_to @source, notice: 'Source was successfully created.' }
        format.json { render json: @source, status: :created, location: @source }
      else
        format.html { render action: "new" }
        format.json { render json: @source.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /sources/1
  # PUT /sources/1.json
  def update
    @source = current_user.sources.find(params[:id])

    #@source = Source.find(params[:id])

    respond_to do |format|
      if @source.update_attributes(params[:source])
        #if @source.save
        if  @source.updater current_user

          format.html { redirect_to @source, notice: 'Source was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @source.errors, status: :unprocessable_entity }

        end

      else
        format.html { render action: "edit" }
        format.json { render json: @source.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sources/1
  # DELETE /sources/1.json
  def destroy
    @source = Source.find(params[:id])
    @source.destroy

    respond_to do |format|
      format.html { redirect_to sources_url }
      format.json { head :no_content }
    end
  end
end
