class ContenttagsController < ApplicationController
  # GET /contenttags
  # GET /contenttags.json
  def index
    #@contenttags = Contenttag.all
    @taggable = find_taggable
  @contenttags = @taggable.contenttags

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @contenttags }
    end
  end

  # GET /contenttags/1
  # GET /contenttags/1.json
  def show
    @contenttag = Contenttag.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @contenttag }
    end
  end

  # GET /contenttags/new
  # GET /contenttags/new.json
  def new
    @contenttag = Contenttag.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @contenttag }
    end
  end

  # GET /contenttags/1/edit
  def edit
    @contenttag = Contenttag.find(params[:id])
  end

  # POST /contenttags
  # POST /contenttags.json
  def create
    #@contenttag = Contenttag.new(params[:contenttag])

  @taggable = find_taggable
  
  @contenttag = @taggable.contenttags.build(params[:contenttag])

    respond_to do |format|
      if @contenttag.save
        format.html { redirect_to @contenttag, notice: 'Contenttag was successfully created.' }
        format.json { render json: @contenttag, status: :created, location: @contenttag }
      else
        format.html { render action: "new" }
        format.json { render json: @contenttag.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /contenttags/1
  # PUT /contenttags/1.json
  def update
    @contenttag = Contenttag.find(params[:id])

    respond_to do |format|
      if @contenttag.update_attributes(params[:contenttag])
        format.html { redirect_to @contenttag, notice: 'Contenttag was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @contenttag.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contenttags/1
  # DELETE /contenttags/1.json
  def destroy
    @contenttag = Contenttag.find(params[:id])
    @contenttag.destroy

    respond_to do |format|
      format.html { redirect_to contenttags_url }
      format.json { head :no_content }
    end
  end

  def find_taggable
    params.each do |name, value|
      if name =~ /(.+)_id$/
        return $1.classify.constantize.find(value)
      end
    end
    nil
  end


end
