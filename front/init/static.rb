use Rack::Static, urls: ['/public']
use Rack::Static, urls: ['/robots.txt'], root: 'public'