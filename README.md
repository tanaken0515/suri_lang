# SuriLang

SuriLang is a rubygem that translates incoming messages as spoken by "[忍者スリスリくん](https://twitter.com/suzurijp)". 

## Requirements

SuriLang depends on [natto](https://github.com/buruzaemon/natto). Please read [Requirements in natto/README\.md at master · buruzaemon/natto](https://github.com/buruzaemon/natto/blob/master/README.md#requirements).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'suri_lang'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install suri_lang

## Usage

```ruby
require 'suri_lang'

SuriLang::Translator.translate('SUZURIの忍者スリスリくんです')
# => "SUZURIの忍者スリスリくんデス" 

greeter = SuriLang::Greeter.random_build
greeter.message
# => "石器ブンブン！ SUZURIの公式忍者、忍者スリスリくんデス。" 
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/tanaken0515/suri_lang. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the SuriLang project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/suri_lang/blob/master/CODE_OF_CONDUCT.md).
