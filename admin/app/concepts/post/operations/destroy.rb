class Post < Sequel::Model(DB)
  class Destroy < Trailblazer::Operation
    step :process

    def process(options, params:)
      Post[params[:id]].destroy
    end
  end
end