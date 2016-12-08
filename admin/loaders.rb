def fake_load(filename)
  eval(File.read(filename))
end

def require_dir(dirname)
  Dir[File.join(File.dirname(__FILE__), dirname, '**', '*.rb')].each {|file| require file }
end