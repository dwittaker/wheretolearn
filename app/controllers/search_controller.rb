class SearchController < ApplicationController
  def search

    if params[:srchquery]
     @searchables = PgSearch.multisearch(params[:srchquery])
      #@portfolios = Portfolio.search_by_link(params[:srchquery])
    else
      #@searchables = null
    end

  end
end
