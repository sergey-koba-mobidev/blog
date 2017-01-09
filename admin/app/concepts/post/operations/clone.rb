class Post < Sequel::Model(DB)
  class Clone < Trailblazer::Operation
    step Model(Post, :find_by)
    step :clone!

    def clone!(options, model:, **)
      params = model.values
      params.delete(:id)
      params[:active] = false
      params[:slug] += '-clone'
      result = Post::Create.(params)
      options['model'] = result['model'] if result.success?
      result.success?
    end
  end
end