class OpinionsController < ApplicationController
  # GET /opinions
  # GET /opinions.json
  def index
    @portfolio = Portfolio.find(params[:portfolio_id])


    @opinion = @portfolio.opinions.all


    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @opinions }
    end
  end

  # GET /opinions/1
  # GET /opinions/1.json
  def show



    @portfolio = Portfolio.find(params[:portfolio_id])

    @opinion = @portfolio.opinions.find(params[:id])


    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @opinion }
    end
  end

  # GET /opinions/new
  # GET /opinions/new.json
  def new

    @portfolio = Portfolio.find(params[:portfolio_id])
    @opinion = @portfolio.opinions.new

    #@opinion = Opinion.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @opinion }
    end
  end

  # GET /opinions/1/edit
  def edit
    @portfolio = Portfolio.find(params[:portfolio_id])
    @opinion = @portfolio.opinions.find(params[:id])

  end

  # POST /opinions
  # POST /opinions.json
  def create
    @portfolio = Portfolio.find(params[:portfolio_id])
    @opinion = @portfolio.opinions.build(params[:opinion])

    @opinion.user = current_user

#    @opinion = Opinion.new(params[:opinion])

    respond_to do |format|
      if @opinion.save
        format.html { redirect_to [@portfolio,@opinion], notice: 'Opinion was successfully created.' }
        format.json { render json: @opinion, status: :created, location: [@portfolio,@opinion] }
      else
        format.html { render action: "new" }
        format.json { render json: @opinion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /opinions/1
  # PUT /opinions/1.json
  def update
    @portfolio = Portfolio.find(params[:portfolio_id])
    @opinion = @portfolio.opinions.find(params[:id])



    respond_to do |format|
      if @opinion.update_attributes(params[:opinion])
        format.html { redirect_to [@portfolio,@opinion], notice: 'Opinion was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @opinion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /opinions/1
  # DELETE /opinions/1.json
  def destroy
    @portfolio = Portfolio.find(params[:portfolio_id])
    @opinion = @portfolio.opinions.find(params[:id])
    @opinion.destroy

    respond_to do |format|
      format.html { redirect_to portfolio_opinions_path [@portfolio] }
      format.json { head :no_content }
    end
  end
end
