module Backup
  class RestorePosts < Trailblazer::Operation
    extend Contract::DSL

    step Contract::Build()
    step Contract::Validate()
    step :restore!

    contract do
      property :data, virtual: true

      validation do
        required(:data).filled
      end
    end


    def restore!(options, params:, **)
      posts = JSON.parse(params['data'])
      posts.each do |post|
        post.delete('id')
        result = Post::Create.(post)
        return false unless result.success?
      end
      options['posts_count'] = posts.size
    end
  end
end