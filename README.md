# NumberToText [![Build Status](https://travis-ci.org/habermann24/number_to_text.svg?branch=master)](https://travis-ci.org/habermann24/number_to_text)

This gem converts numbers to text. This might be useful if you want to display the amount of a receipt in words.

Currently, only german output is supported. However, the goal is to provide YML language files to make this universal.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'number_to_text'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install number_to_text

## Usage

```ruby
include NumberToText

>> number_to_text(123)
=> "einhundertdreiundzwanzig"

>> number_to_text(1503053)
=> "eine Million fünfhundertdreitausenddreiundfünfzig"
```

## Contributing

1. Fork it ( https://github.com/habermann24/number_to_text/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
