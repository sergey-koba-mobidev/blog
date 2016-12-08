module App
  module Controllers
    module Posts
      class Destroy < Posts::Base
        def call(params)
          run Post::Destroy do |op|

          end
          redirect_to '/'
        end
      end
    end
  end
end