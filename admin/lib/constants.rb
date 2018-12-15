module Constants
  def self.frontend_url
    return 'https://1devblog.org' if ENV['RACK_ENV'] == 'production'
    return 'http://localhost:3001'
  end

  def self.frontend_api_url
    return 'https://1devblog.org/api' if ENV['RACK_ENV'] == 'production'
    return 'http://front:3001/api'
  end

  def self.api_token
    return ENV['API_TOKEN'] if ENV['RACK_ENV'] == 'production'
    return 'development_token'
  end

  def self.default_lang
    'en'
  end
end