class Category3sController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :create, :edit, :update]
  load_and_authorize_resource
  # GET /category3s
  # GET /category3s.json
  def index
#    @category3s = Category3.all

    @category1 = Category1.find(params[:category1_id])
    @category2 = @category1.category2s.find(params[:category2_id])
    @category3 = @category2.category3s.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: [@category1, @category2,@category3] }

    end
  end

  # GET /category3s/1
  # GET /category3s/1.json
  def show
    #@category3 = Category3.find(params[:id])
    @category1 = Category1.find(params[:category1_id])

    @category2 = @category1.category2s.find(params[:category2_id])

    @category3 = @category2.category3s.find(params[:id])
    

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: [@category1, @category2,@category3] }
      #format.json { render json: [@category1, @category2,@category3] }
    end
  end

  # GET /category3s/new
  # GET /category3s/new.json
  def new
    #@category3 = Category3.new

    @category1 = Category1.find(params[:category1_id])
    #@category2 = @category1.
    @category2 = @category1.category2s.find(params[:category2_id])
    @category3 = @category2.category3s.new 

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: [@category1, @category2, @category3] }
    end
  end

  # GET /category3s/1/edit
  def edit
  @category1 = Category1.find(params[:category1_id])
  @category2 = @category1.category2s.find(params[:category2_id])


    @category3 = @category2.category3s.find(params[:id])
  end

  # POST /category3s
  # POST /category3s.json
  def create


  @category1 = Category1.find(params[:category1_id])
  @category2 = @category1.category2s.find(params[:category2_id])

  @category3 = @category2.category3s.build(params[:category3])
    



    respond_to do |format|
      if @category3.save
        format.html { redirect_to [@category1, @category2,@category3], notice: 'Category3 was successfully created.' }
        format.json { render json: @category3, status: :created, location: [@category1, @category2,@category3] }
      else
        format.html { render action: "new" }
        format.json { render json: @category3.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /category3s/1
  # PUT /category3s/1.json
  def update


  #@category1 = Category1.find(params[:category1_id])
  #@category2 = @category1.category2s.find(params[:category2_id])
  #@category3 = @category2.category3s.find(params[:id])
    @category3 = Category3.find(params[:id])

    respond_to do |format|
      if @category3.update_attributes(params[:category3])
        format.html { redirect_to [@category1, @category2,@category3], notice: 'Category3 was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @category3.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /category3s/1
  # DELETE /category3s/1.json
  def destroy
  @category1 = Category1.find(params[:category1_id])
  @category2 = @category1.category2s.find(params[:category2_id])

  @category3 = @category2.category3s.find(params[:id])
    #@category3 = Category3.find(params[:id])
    @category3.destroy

    respond_to do |format|
      format.html { redirect_to category1_category2_category3s_path }
      format.json { head :no_content }
    end
  end

  
end
