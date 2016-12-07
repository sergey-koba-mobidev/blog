require 'hanami/router'

class Router
  @@router = nil

  def self.app
    @@router = Hanami::Router.new(namespace: App::Controllers) do
      get '/', to: 'posts#index'
      post '/posts', to: 'posts#create', as: :create_post
      get '/posts/destroy/:id', to: 'posts#destroy', as: :destroy_post
      get '/posts/new', to: 'posts#new', as: :new_post
    end

    @@router
  end

  def self.path(*p)
    @@router.path(*p)
  end

  def self.print_routes
    puts @@router.inspector.to_s
  end
end