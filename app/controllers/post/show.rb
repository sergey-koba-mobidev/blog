# controllers/post/show.rb
require 'hanami/controller'

class Post < Sequel::Model(DB)
  class Show
    include ::Hanami::Action

    def call(params)
      post = Post[params[:id]]
      render_layout PostCell.new(post)
    end

    def render_layout(content = '')
      self.body = LayoutCell.new(nil).() { content }
    end
  end
end