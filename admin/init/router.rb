require 'hanami/router'

class Router
  @@router = nil

  def self.app
    @@router = Hanami::Router.new(namespace: App::Controllers) do
      get '/', to: 'posts#index'
      get '/page/:page', to: 'posts#index'
      post '/posts', to: 'posts#create', as: :create_post
      get '/posts/:id/edit', to: 'posts#edit', as: :edit_post
      post '/posts/:id', to: 'posts#update', as: :update_post
      get '/posts/:id/destroy/', to: 'posts#destroy', as: :destroy_post
      get '/posts/new', to: 'posts#new', as: :new_post

      get '/login', to: 'sessions#new', as: :login
      post '/login', to: 'sessions#create'
      get '/logout', to: 'sessions#destroy', as: :logout
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