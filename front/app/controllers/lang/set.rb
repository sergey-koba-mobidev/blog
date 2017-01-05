module App
  module Controllers
    module Lang
      class Set < BaseAction
        def call(params)
          session[:lang] = params[:lang] if LANGS.include? params[:lang]
          redirect_to '/'
        end
      end
    end
  end
end