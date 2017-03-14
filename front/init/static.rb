use Rack::Static, urls: ['/public']
use Rack::Static, urls: ['/robots.txt'], root: 'public'
use Rack::Static, :urls => {'/sitemap.xml.gz' => 'sitemaps/sitemap.xml.gz'}, :root => 'public'
use Rack::Static, urls: ['/css'], root: 'public'
use Rack::Static, urls: ['/js'], root: 'public'
use Rack::Static, urls: ['/images'], root: 'public'
use Rack::Static, urls: ['/fonts'], root: 'public'