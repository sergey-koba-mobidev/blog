use Rack::Static, urls: ['/public']
use Rack::Static, urls: ['/robots.txt'], root: 'public'
use Rack::Static, :urls => {'/sitemap.xml.gz' => 'sitemaps/sitemap.xml.gz'}, :root => 'public'