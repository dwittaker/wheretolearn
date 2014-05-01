class CosttypesController < ApplicationController
  load_and_authorize_resource
  # GET /costtypes
  # GET /costtypes.json
  def index
    @costtypes = Costtype.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @costtypes }
    end
  end

  # GET /costtypes/1
  # GET /costtypes/1.json
  def show
    @costtype = Costtype.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @costtype }
    end
  end

  # GET /costtypes/new
  # GET /costtypes/new.json
  def new
    @costtype = Costtype.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @costtype }
    end
  end

  # GET /costtypes/1/edit
  def edit
    @costtype = Costtype.find(params[:id])
  end

  # POST /costtypes
  # POST /costtypes.json
  def create
    @costtype = Costtype.new(params[:costtype])

    respond_to do |format|
      if @costtype.save
        format.html { redirect_to @costtype, notice: 'Costtype was successfully created.' }
        format.json { render json: @costtype, status: :created, location: @costtype }
      else
        format.html { render action: "new" }
        format.json { render json: @costtype.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /costtypes/1
  # PUT /costtypes/1.json
  def update
    @costtype = Costtype.find(params[:id])

    respond_to do |format|
      if @costtype.update_attributes(params[:costtype])
        format.html { redirect_to @costtype, notice: 'Costtype was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @costtype.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /costtypes/1
  # DELETE /costtypes/1.json
  def destroy
    @costtype = Costtype.find(params[:id])
    @costtype.destroy

    respond_to do |format|
      format.html { redirect_to costtypes_url }
      format.json { head :no_content }
    end
  end
end
