class User < Sequel::Model(DB)
  class Create < Trailblazer::Operation
    include Model
    model User, :create

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

    def process(params)
      validate(params) do
        contract.password = BCrypt::Password.create(params[:password])
        set_timestamps
        contract.save
      end
    end

    private

    def set_timestamps
      timestamp = Time.now
      model.created_at = timestamp
      model.updated_at = timestamp
    end
  end

  class FindForAuth < Trailblazer::Operation
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

    def process(params)
      validate(params) do
        @model = User.where(username: params['login']).or(email: params['login']).first
      end
    end
  end
end