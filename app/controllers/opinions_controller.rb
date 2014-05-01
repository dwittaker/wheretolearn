class OpinionsController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :create, :edit, :update]
  load_and_authorize_resource
  # GET /opinions
  # GET /opinions.json

  def find_opinionable
    params.each do |name, value|
      if name =~ /(.+)_id$/
        return $1.classify.constantize.find(value)
      end
    end
    nil
  end
#TODO: NEED TO IMPLEMENT POLYMORPHIC CONTROLLERS

  def index
    #@portfolio = Portfolio.find(params[:portfolio_id])

    @opinionable = find_opinionable

    @opinion = @opinionable.opinions.all


    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @opinions }
    end
  end

  # GET /opinions/1
  # GET /opinions/1.json
  def show


    @opinionable = find_opinionable

    @opinion = @opinionable.opinions.find(params[:id])

    #@portfolio = Portfolio.find(params[:portfolio_id])


    #@opinion = @portfolio.opinions.find(params[:id])


    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @opinion }
    end
  end

  # GET /opinions/new
  # GET /opinions/new.json
  def new

    @opinionable = find_opinionable
    #@portfolio = Portfolio.find(params[:portfolio_id])
    @opinion = @opinionable.opinions.new

    #@opinion = Opinion.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @opinion }
    end
  end

  # GET /opinions/1/edit
  def edit
    @opinionable = find_opinionable
    #@portfolio = Portfolio.find(params[:portfolio_id])
    @opinion = @opinionable.opinions.find(params[:id])

  end

  # POST /opinions
  # POST /opinions.json
  def create
    @opinionable = find_opinionable
    #@portfolio = Portfolio.find(params[:portfolio_id])
    @opinion = @opinionable.opinions.build(params[:opinion])

    @opinion.user = current_user

#    @opinion = Opinion.new(params[:opinion])

    respond_to do |format|
      if @opinion.save
        format.html { redirect_to [@opinionable,@opinion], notice: 'Opinion was successfully created.' }
        format.json { render json: @opinion, status: :created, location: [@opinionable,@opinion] }
      else
        format.html { render action: "new" }
        format.json { render json: @opinion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /opinions/1
  # PUT /opinions/1.json
  def update
    @opinionable = find_opinionable
    #@portfolio = Portfolio.find(params[:portfolio_id])
    @opinion = @opinionable.opinions.find(params[:id])



    respond_to do |format|
      if @opinion.update_attributes(params[:opinion])
        format.html { redirect_to [@opinionable,@opinion], notice: 'Opinion was successfully updated.' }
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
    @opinionable = find_opinionable
    #@portfolio = Portfolio.find(params[:portfolio_id])
    @opinion = @opinionable.opinions.find(params[:id])
    @opinion.destroy

    respond_to do |format|
      format.html { redirect_to polymorphic_path([@opinionable,Opinion]) }
      format.json { head :no_content }
    end
  end
end
