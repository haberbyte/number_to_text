require 'number_to_text/version'

require 'active_support'
require 'active_support/core_ext'

module NumberToText
  extend ActiveSupport::Autoload

  eager_autoload do
    autoload :NumberToTextConverter
  end

  module_function

  def number_to_text(number, options = {})
    NumberToTextConverter.convert(number, options)
  end
end
