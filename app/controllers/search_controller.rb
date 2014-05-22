class SearchController < ApplicationController
  def search

    if params[:srchquerybig]
     @searchables = PgSearch.multisearch(params[:srchquerybig])
      #@portfolios = Portfolio.search_by_link(params[:srchquery])
    else
      if params[:srchquery]
        @searchables = PgSearch.multisearch(params[:srchquery])
        #@portfolios = Portfolio.search_by_link(params[:srchquery])
      else

        #@searchables = null
      end
      #@searchables = null
    end

  end
end
