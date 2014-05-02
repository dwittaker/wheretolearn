
Blogit::PostsController.class_eval do


    def index
      respond_to do |format|

        format.xml {
          @posts = Blogit::Post.order('created_at DESC')
        }
        format.html {
          if params[:srchquery]
            @posts = Blogit::Post.search_by_basic(params[:srchquery]).for_index(params[:page])
          else
            @posts = Blogit::Post.for_index(params[:page])
          end
        }
        format.rss {
          @posts = Blogit::Post.order('created_at DESC')
        }
      end
    end

end
