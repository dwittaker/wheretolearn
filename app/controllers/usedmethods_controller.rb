class UsedmethodsController < ApplicationController
  # GET /usedmethods
  # GET /usedmethods.json
  def index
    @usedmethods = Usedmethod.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @usedmethods }
    end
  end

  # GET /usedmethods/1
  # GET /usedmethods/1.json
  def show
    @usedmethod = Usedmethod.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @usedmethod }
    end
  end

  # GET /usedmethods/new
  # GET /usedmethods/new.json
  def new
    @usedmethod = Usedmethod.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @usedmethod }
    end
  end

  # GET /usedmethods/1/edit
  def edit
    @usedmethod = Usedmethod.find(params[:id])
  end

  # POST /usedmethods
  # POST /usedmethods.json
  def create
    @usedmethod = Usedmethod.new(params[:usedmethod])

    respond_to do |format|
      if @usedmethod.save
        format.html { redirect_to @usedmethod, notice: 'Usedmethod was successfully created.' }
        format.json { render json: @usedmethod, status: :created, location: @usedmethod }
      else
        format.html { render action: "new" }
        format.json { render json: @usedmethod.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /usedmethods/1
  # PUT /usedmethods/1.json
  def update
    @usedmethod = Usedmethod.find(params[:id])

    respond_to do |format|
      if @usedmethod.update_attributes(params[:usedmethod])
        format.html { redirect_to @usedmethod, notice: 'Usedmethod was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @usedmethod.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /usedmethods/1
  # DELETE /usedmethods/1.json
  def destroy
    @usedmethod = Usedmethod.find(params[:id])
    @usedmethod.destroy

    respond_to do |format|
      format.html { redirect_to usedmethods_url }
      format.json { head :no_content }
    end
  end
end
