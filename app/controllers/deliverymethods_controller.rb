class DeliverymethodsController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :create, :edit, :update]
  # GET /deliverymethods
  # GET /deliverymethods.json
  def index
    @deliverymethods = Deliverymethod.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @deliverymethods }
    end
  end

  # GET /deliverymethods/1
  # GET /deliverymethods/1.json
  def show
    @deliverymethod = Deliverymethod.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @deliverymethod }
    end
  end

  # GET /deliverymethods/new
  # GET /deliverymethods/new.json
  def new
    @deliverymethod = Deliverymethod.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @deliverymethod }
    end
  end

  # GET /deliverymethods/1/edit
  def edit
    @deliverymethod = Deliverymethod.find(params[:id])
  end

  # POST /deliverymethods
  # POST /deliverymethods.json
  def create
    @deliverymethod = Deliverymethod.new(params[:deliverymethod])

    respond_to do |format|
      if @deliverymethod.save
        format.html { redirect_to @deliverymethod, notice: 'Deliverymethod was successfully created.' }
        format.json { render json: @deliverymethod, status: :created, location: @deliverymethod }
      else
        format.html { render action: "new" }
        format.json { render json: @deliverymethod.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /deliverymethods/1
  # PUT /deliverymethods/1.json
  def update
    @deliverymethod = Deliverymethod.find(params[:id])

    respond_to do |format|
      if @deliverymethod.update_attributes(params[:deliverymethod])
        format.html { redirect_to @deliverymethod, notice: 'Deliverymethod was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @deliverymethod.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /deliverymethods/1
  # DELETE /deliverymethods/1.json
  def destroy
    @deliverymethod = Deliverymethod.find(params[:id])
    @deliverymethod.destroy

    respond_to do |format|
      format.html { redirect_to deliverymethods_url }
      format.json { head :no_content }
    end
  end
end
