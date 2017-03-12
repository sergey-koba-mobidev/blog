require_relative '../base_action'

module App
  module Controllers
    module Backup
      class Download < BaseAction
        before :authenticate

        use ::Rack::Chunked

        def call(params)
          self.format = :json
          self.headers.merge!({ 'Content-Disposition' => "attachment; filename=1devblog-#{Time.now.strftime("%Y-%m-%d-%H-%M")}.backup.json" })
          self.body = Enumerator.new do |yielder|
            yielder << "["
            posts = Post.all
            posts.each_with_index do |post, index|
              yielder << Post::Representer::Backup.new(post).to_json
              yielder << ",\n" unless index == posts.size - 1
            end
            yielder << "]"
          end
        end
      end
    end
  end
end