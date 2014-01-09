class Category1sController < ApplicationController
  # GET /category1s
  # GET /category1s.json
  def index
    @category1s = Category1.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @category1s }
    end
  end

  # GET /category1s/1
  # GET /category1s/1.json
  def show
    @category1 = Category1.find(params[:id])


    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @category1 }
    end
  end

  # GET /category1s/new
  # GET /category1s/new.json
  def new
    @category1 = Category1.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @category1 }
    end
  end

  # GET /category1s/1/edit
  def edit
    @category1 = Category1.find(params[:id])
  end

  # POST /category1s
  # POST /category1s.json
  def create
    @category1 = Category1.new(params[:category1])

    respond_to do |format|
      if @category1.save
        format.html { redirect_to @category1, notice: 'Category1 was successfully created.' }
        format.json { render json: @category1, status: :created, location: @category1 }
      else
        format.html { render action: "new" }
        format.json { render json: @category1.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /category1s/1
  # PUT /category1s/1.json
  def update
    @category1 = Category1.find(params[:id])

    respond_to do |format|
      if @category1.update_attributes(params[:category1])
        format.html { redirect_to @category1, notice: 'Category1 was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @category1.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /category1s/1
  # DELETE /category1s/1.json
  def destroy
    @category1 = Category1.find(params[:id])
    @category1.destroy

    respond_to do |format|
      format.html { redirect_to category1s_url }
      format.json { head :no_content }
    end
  end
end
