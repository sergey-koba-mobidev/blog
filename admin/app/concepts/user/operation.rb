class User < Sequel::Model(DB)
  class Create < Trailblazer::Operation
    extend Contract::DSL

    step Model(User, :new)
    step :hash_password
    step Contract::Build()
    step Contract::Validate()
    step :set_timestamps
    step Contract::Persist()

    contract do
      property :username
      property :email
      property :password

      validation do
        required(:username).filled
        required(:email).filled
        required(:password).filled
      end
    end

    def hash_password(options, params:, model:, **)
      params[:password] = BCrypt::Password.create(params[:password])
    end

    def set_timestamps(options, model:, **)
      timestamp = Time.now
      model.created_at = timestamp
      model.updated_at = timestamp
    end
  end

  class FindForAuth < Trailblazer::Operation
    extend Contract::DSL

    step Contract::Build()
    step Contract::Validate()
    step :model!

    contract do
      property :login, virtual: true
      property :password, virtual: true

      validation do
        configure do
          config.messages_file = 'config/error_messages.yml'
          option :form

          def valid_login_password?(value)
            u = User.where(username: form.login).or(email: form.login).first
            !u.nil? && BCrypt::Password.new(u.password) == form.password
          end
        end

        required(:login).filled
        required(:password).filled
        required(:password).filled(:valid_login_password?)
      end
    end

    def model!(options, params:, **)
      options['model'] = User.where(username: params['login']).or(email: params['login']).first
    end
  end
end