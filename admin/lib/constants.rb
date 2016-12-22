module Constants
  def self.frontend_article_url
    return 'http://1devblog.org/article/' if ENV['RACK_ENV'] == 'production'
    return 'http://localhost:3001/article/'
  end
end