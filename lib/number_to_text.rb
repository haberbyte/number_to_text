require 'number_to_text/version'

require 'active_support'
require 'active_support/core_ext'

module NumberToText
  autoload :Converter, 'number_to_text/converter'

  module_function

  def number_to_text(number, options = {})
    Converter.convert(number, options)
  end
end
