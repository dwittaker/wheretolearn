class PortfoliosController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :create, :edit, :update]
  load_and_authorize_resource
  # GET /portfolios
  # GET /portfolios.json

  def index


    #if params[:tag]
    #  #@sources = Source.tagged_with(params[:tag])
    #  @portfolios = Portfolio.all
    if params[:srchquery]
      @portfolios = Portfolio.search_by_basic(params[:srchquery])
      #@portfolios = Portfolio.search_by_link(params[:srchquery])
    else
      @portfolios = Portfolio.all
    end


    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @portfolios }
    end
  end

  # GET /portfolios/1
  # GET /portfolios/1.json
  def show
    @portfolio = Portfolio.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @portfolio }
    end
  end

  # GET /portfolios/new
  # GET /portfolios/new.json
  def new
    @portfolio = Portfolio.new
    @portfolio.usedmethods.build
    #@portfolio.usedmethods.deliverymethods.build
    @subjects = Subject.find(:all,:order => "name")
    @subject_modules = SubjectModule.find(:all, :order => "smname")

    @deliverymethods = Deliverymethod.find(:all,:order => "dmcod")
    @selected_subject = @subjects[0]
    @currlist = view_context.currencylist
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @portfolio }
    end
  end

  # GET /portfolios/1/edit
  def edit
    @portfolio = Portfolio.find(params[:id])
    @portfolio.usedmethods.build
    @subjects = Subject.find(:all,:order => "name")
    @subject_modules = SubjectModule.find(:all, :order => "smname")

    @deliverymethods = Deliverymethod.find(:all,:order => "dmcod")
    @selected_subject = @portfolio.subject_module.subject
    @currlist = view_context.currencylist
    @usedmethods = @portfolio.usedmethods
  end

  # POST /portfolios
  # POST /portfolios.json
  def create
    @portfolio = current_user.portfolios.new(params[:portfolio])


    respond_to do |format|
      if @portfolio.save
        format.html { redirect_to @portfolio, notice: 'Portfolio was successfully created.' }
        format.json { render json: @portfolio, status: :created, location: @portfolio }
      else
        format.html { render action: "new" }
        format.json { render json: @portfolio.errors, status: :unprocessable_entity }
      end
    end
  end



  # PUT /portfolios/1
  # PUT /portfolios/1.json
  def update
    @portfolio = Portfolio.find(params[:id])


    respond_to do |format|
      if @portfolio.update_attributes(params[:portfolio])

        #if @portfolio.save
        if  @portfolio.updater current_user
          format.html { redirect_to @portfolio, notice: 'Portfolio was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @portfolio.errors, status: :unprocessable_entity }

        end
      else
        format.html { render action: "edit" }
        format.json { render json: @portfolio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /portfolios/1
  # DELETE /portfolios/1.json
  def destroy
    @portfolio = Portfolio.find(params[:id])
    @portfolio.destroy

    respond_to do |format|
      format.html { redirect_to portfolios_url }
      format.json { head :no_content }
    end
  end
end
