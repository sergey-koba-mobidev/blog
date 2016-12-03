require 'hanami/router'

class Router
  attr_reader :router

  def initialize
    @router = Hanami::Router.new(namespace: App::Controllers) do
      get '/', to: 'posts#index'
    end
    @router.resource 'posts', only: [:show, :create, :new]
  end

  def app
    @router
  end
end