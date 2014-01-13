 class Category2sController < ApplicationController
  # GET /category2s
  # GET /category2s.json
  def index
    #@category2s = Category2.all

    @category1 = Category1.find(params[:category1_id])
    @category2 = @category1.category2s.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: [@category1, @category2] }
    end
  end

  # GET /category2s/1
  # GET /category2s/1.json
  def show
    @category1 = Category1.find(params[:category1_id])

    @category2 = @category1.category2s.find(params[:id])
    

    #@category2 = Category2.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @category2 }
    end
  end

  # GET /category2s/new
  # GET /category2s/new.json
  def new
#    @category2 = Category2.new

    @category1 = Category1.find(params[:category1_id])
    @category2 = @category1.category2s.new 

#category1 = Category1.find(params[:category1_id])
#category2 = Category2.new(params[:category2])
#category2.category1 = category1

  #@category2.category1_id = params[:category1_id]

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @category2 }
    end
  end


  # GET /category2s/1/edit
  def edit
#    @category2 = Category2.find(params[:id])

  @category1 = Category1.find(params[:category1_id])
  @category2 = @category1.category2s.find(params[:id])


  end

  # POST /category2s
  # POST /category2s.json
  def create
    #eg @job = @venue.jobs.new(params[:job])

    #@category2 = Category2.new(params[:category2])
    #@category2.category1_id = params[:category1_id]

  @category1 = Category1.find(params[:category1_id])
  @category2 = @category1.category2s.build(params[:category2])

    respond_to do |format|
      if @category2.save
        format.html { redirect_to  [@category1,@category2], notice: 'Category2 was successfully created.' }
        format.json { render json: @category2, status: :created, location:   [@category1,@category2]  }
      else
        format.html { render action: "new" }
        format.json { render json: @category2.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /category2s/1
  # PUT /category2s/1.json
  def update
   # @category2 = Category2.find(params[:id])

  @category1 = Category1.find(params[:category1_id])
  @category2 = @category1.category2s.find(params[:id])

    respond_to do |format|
      if @category2.update_attributes(params[:category2])
        format.html { redirect_to [@category1,@category2], notice: 'Category2 was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @category2.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /category2s/1
  # DELETE /category2s/1.json
  def destroy

#    @category2 = Category2.find(params[:id])

  @category1 = Category1.find(params[:category1_id])
  @category2 = @category1.category2s.find(params[:id])


    @category2.destroy

    respond_to do |format|
      format.html { redirect_to category1_category2s_path }
      format.json { head :no_content }
    end
  end
end
