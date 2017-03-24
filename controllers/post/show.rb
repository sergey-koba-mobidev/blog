# controllers/post/show.rb
require 'hanami/controller'

class Post < Sequel::Model(DB)
  class Show
    include ::Hanami::Action

    def call(params)
      post = Post[params[:id]]
      self.body = "<h1>#{post.title}</h1> <p>#{post.content}</p>"
    end
  end
end