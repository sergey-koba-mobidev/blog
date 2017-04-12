require 'rss'

module App
  module Controllers
    module Posts
      class Rss < BaseAction
        include R18n::Helpers

        def call(params)
          posts = Post::PagedList.(page: params[:page], lang: R18n.get.locale.code)['result.posts']
          content = RSS::Maker.make('2.0') do |m|
            m.channel.title = t.seo.title
            m.channel.link  = "1devblog.org"
            m.channel.description = t.seo.description
            m.channel.language = R18n.get.locale.code
            m.items.do_sort = true

            posts.each do |p|
              i = m.items.new_item
              i.title = p.title
              i.link =  "1devblog.org/#{p.lang != Constants::default_lang ? "#{p.lang}/" : ''}article/#{p.slug}"
              i.description = p.seo_description
              i.date = p.updated_at
              i.pubDate = p.activated_at
            end
          end

          self.headers.merge!({ 'Content-Type' => 'application/rss+xml' })
          self.body = content.to_s
        end
      end
    end
  end
end