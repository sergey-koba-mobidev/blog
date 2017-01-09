module Constants
  def self.frontend_article_url
    return 'http://1devblog.org/article/' if ENV['RACK_ENV'] == 'production'
    return 'http://localhost:3001/article/'
  end

  def self.frontend_api_url
    return 'http://1devblog.org/api' if ENV['RACK_ENV'] == 'production'
    return 'http://front:3001/api'
  end

  def self.api_token
    return ENV['API_TOKEN'] if ENV['RACK_ENV'] == 'production'
    return 'development_token'
  end
end