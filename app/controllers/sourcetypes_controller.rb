class SourcetypesController < ApplicationController
  # GET /sourcetypes
  # GET /sourcetypes.json
  def index
    @sourcetypes = Sourcetype.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sourcetypes }
    end
  end

  # GET /sourcetypes/1
  # GET /sourcetypes/1.json
  def show
    @sourcetype = Sourcetype.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @sourcetype }
    end
  end

  # GET /sourcetypes/new
  # GET /sourcetypes/new.json
  def new
    @sourcetype = Sourcetype.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @sourcetype }
    end
  end

  # GET /sourcetypes/1/edit
  def edit
    @sourcetype = Sourcetype.find(params[:id])
  end

  # POST /sourcetypes
  # POST /sourcetypes.json
  def create
    @sourcetype = Sourcetype.new(params[:sourcetype])

    respond_to do |format|
      if @sourcetype.save
        format.html { redirect_to @sourcetype, notice: 'Sourcetype was successfully created.' }
        format.json { render json: @sourcetype, status: :created, location: @sourcetype }
      else
        format.html { render action: "new" }
        format.json { render json: @sourcetype.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /sourcetypes/1
  # PUT /sourcetypes/1.json
  def update
    @sourcetype = Sourcetype.find(params[:id])

    respond_to do |format|
      if @sourcetype.update_attributes(params[:sourcetype])
        format.html { redirect_to @sourcetype, notice: 'Sourcetype was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @sourcetype.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sourcetypes/1
  # DELETE /sourcetypes/1.json
  def destroy
    @sourcetype = Sourcetype.find(params[:id])
    @sourcetype.destroy

    respond_to do |format|
      format.html { redirect_to sourcetypes_url }
      format.json { head :no_content }
    end
  end
end
