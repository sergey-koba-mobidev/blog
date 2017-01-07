require 'hanami/router'

class Router
  @@router = nil

  def self.app
    @@router = Hanami::Router.new(namespace: App::Controllers) do
      get '(/:lang)/', lang: /en/, to: 'posts#index', as: :root
      get '(/:lang)/page/:page', lang: /en/, to: 'posts#index'
      get '(/:lang)/article/:slug', lang: /en/, to: 'posts#show', as: :show_post
      get '(/:lang)/tag/:tag', lang: /en/, to: 'tags#show', as: :show_tag
      get '(/:lang)/tag/:tag/page/:page', lang: /en/, to: 'tags#show'
    end
    @@router
  end

  def self.path(route, *args)
    # Add selected lang to route
    if R18n.get && R18n.get.locale.code != DEFAULT_LANG
      if args[0].nil?
        args[0] = {lang: R18n.get.locale.code}
      else
        args[0].merge!(lang: R18n.get.locale.code)
      end
    end

    self.app if @@router.nil?
    @@router.path(route, *args)
  end

  def self.print_routes
    self.app if @@router.nil?
    puts @@router.inspector.to_s
  end
end