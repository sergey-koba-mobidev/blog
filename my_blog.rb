# my_blog.rb
require 'hanami/router'

class MyBlog
  def self.router
    Hanami::Router.new do
      get '/',        to: ->(env) { [200, {}, ['Hello from My Blog']] }
      get '/about',   to: ->(env) { [200, {}, ['<h1>About</h1>']] }
      get 'post/:id', to: Post::Show
    end
  end
end