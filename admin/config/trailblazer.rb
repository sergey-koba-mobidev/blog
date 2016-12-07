# Use dry validations
Reform::Contract.class_eval { feature Reform::Form::Dry }
Reform::Form.class_eval { feature Reform::Form::Dry }

# Load concepts
Trailblazer::Loader.new.(concepts_root: 'app/concepts/') do |file|
  require_relative(file)
end

# Formular
Formular::Helper.builder = :bootstrap3