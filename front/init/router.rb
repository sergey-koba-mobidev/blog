require 'hanami/router'

class Router
  @@router = nil

  def self.app
    @@router = Hanami::Router.new(namespace: App::Controllers) do
      get '/', to: 'posts#index'
      get '/page/:page', to: 'posts#index'
      get '/article/:slug', to: 'posts#show', as: :show_post
    end
    @@router
  end

  def self.path(*p)
    @@router.path(*p)
  end

  def self.print_routes
    self.app if @@router.nil?
    puts @@router.inspector.to_s
  end
end