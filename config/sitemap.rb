
#include Blogit::Engine.app.url_helpers

# Set the host name for URL creation


SitemapGenerator::Sitemap.default_host = "http://www.wheretolearn.it/"
SitemapGenerator::Sitemap.sitemaps_path = 'sitemaps/'
SitemapGenerator::Sitemap.compress = false

SitemapGenerator::Sitemap.create do
  # Put links creation logic here.
  #
  # The root path '/' and sitemap index file are added automatically for you.
  # Links are added to the Sitemap in the order they are specified.
  #
  # Usage: add(path, options={})
  #        (default options are used if you don't specify)
  #
  # Defaults: :priority => 0.5, :changefreq => 'weekly',
  #           :lastmod => Time.now, :host => default_host
  #
  # Examples:
  #
  # Add '/articles'
  #
  #   add articles_path, :priority => 0.7, :changefreq => 'daily'
  #

  # Add all Subjects:

  add subjects_path, :priority => 0.7, :changefreq => 'daily'

    Subject.find_each do |sub|
       add subject_path(sub), :lastmod => sub.updated_at

      sub.subject_modules.find_each do |smod|
          add subject_subject_module_path(sub,smod), :lastmod => smod.updated_at
      end

    end


  # Add all Sources:

  add sources_path, :priority => 0.7, :changefreq => 'daily'


    Source.find_each do |src|
      add source_path(src), :lastmod => src.updated_at
    end

  # Add all Portfolios

  add portfolios_path, :priority => 0.8, :changefreq => 'daily'

    Portfolio.find_each do |prt|
      add portfolio_path(prt), :lastmod => prt.updated_at
    end

  # Add all Opinions

  add opinions_path, :priority => 0.8, :changefreq => 'daily'

    Opinion.find_each do |opn|
      add opinion_path(opn), :lastmod => opn.updated_at
    end

  # Add all Blogs

  add blogit_path, :priority => 0.9, :changefreq => 'daily'

  Blogit::Post.find_each do |blg|

    add Blogit::Engine.app.url_helpers.post_path(blg), :lastmod => blg.updated_at
    #add blogit.post_path(blogit.blg), :lastmod => blogit.blg.updated_at

    #add blogit.post_path(blg), :lastmod => blg.updated_at

    #add url_for(blg), :lastmod => blg.updated_at

  end

end
