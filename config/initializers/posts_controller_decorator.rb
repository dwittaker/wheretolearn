
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

    def update
      @post = current_blogger.blog_posts.find(params[:id])
      @newpost = params[:post]

      @newpost['body'].strip!
      @newpost['body'].gsub! "\r\n", ""
      @newpost['body'].gsub! "<a href=", "<a target=_blank href="

#      if @newpost['body'].exclude? "http://" then
#        @newpost['body'].gsub! "href=", "href="
#      end

      if @post.update_attributes(params[:post])
        redirect_to @post, notice: t(:blog_post_was_successfully_updated, scope: 'blogit.posts')
      else
        render action: "edit"
      end
    end


end
