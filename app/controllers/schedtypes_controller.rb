class SchedtypesController < ApplicationController
  # GET /schedtypes
  # GET /schedtypes.json
  def index
    @schedtypes = Schedtype.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @schedtypes }
    end
  end

  # GET /schedtypes/1
  # GET /schedtypes/1.json
  def show
    @schedtype = Schedtype.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @schedtype }
    end
  end

  # GET /schedtypes/new
  # GET /schedtypes/new.json
  def new
    @schedtype = Schedtype.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @schedtype }
    end
  end

  # GET /schedtypes/1/edit
  def edit
    @schedtype = Schedtype.find(params[:id])
  end

  # POST /schedtypes
  # POST /schedtypes.json
  def create
    @schedtype = Schedtype.new(params[:schedtype])

    respond_to do |format|
      if @schedtype.save
        format.html { redirect_to @schedtype, notice: 'Schedtype was successfully created.' }
        format.json { render json: @schedtype, status: :created, location: @schedtype }
      else
        format.html { render action: "new" }
        format.json { render json: @schedtype.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /schedtypes/1
  # PUT /schedtypes/1.json
  def update
    @schedtype = Schedtype.find(params[:id])

    respond_to do |format|
      if @schedtype.update_attributes(params[:schedtype])
        format.html { redirect_to @schedtype, notice: 'Schedtype was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @schedtype.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /schedtypes/1
  # DELETE /schedtypes/1.json
  def destroy
    @schedtype = Schedtype.find(params[:id])
    @schedtype.destroy

    respond_to do |format|
      format.html { redirect_to schedtypes_url }
      format.json { head :no_content }
    end
  end
end
