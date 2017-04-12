module Constants
  def self.api_token
    return ENV['API_TOKEN'] if ENV['RACK_ENV'] == 'production'
    return 'development_token'
  end

  def self.default_lang
    'en'
  end
end#