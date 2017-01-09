class Sitemap
  class Generate < Trailblazer::Operation
    step :generate!

    def generate!(options)
      SitemapGenerator::Interpreter.run(config_file: 'config/sitemap.rb', verbose: true)
    end
  end
end