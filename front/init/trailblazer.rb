require 'reform'
require 'reform/form/dry'
require 'trailblazer'
require 'trailblazer-loader'
require 'trailblazer/cell'
require 'cell/erb'

# Use dry validations
Reform::Contract.class_eval { feature Reform::Form::Dry }
Reform::Form.class_eval { feature Reform::Form::Dry }

# Load concepts
Trailblazer::Loader.new.(concepts_root: 'app/concepts/') do |file|
  load(file)
end