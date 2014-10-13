# Rspec::Siren

[![Gem Version](https://badge.fury.io/rb/rspec-siren.svg)](http://badge.fury.io/rb/rspec-siren)

Helpers for testing [siren](https://github.com/kevinswiber/siren) objects with
RSpec

## Installation

Add this line to your application's Gemfile:

    gem 'rspec-siren'

And then execute:

    $ bundle

In your `spec_helper.rb` add: `require 'rspec-siren'`

## Usage

```ruby
require 'spec_helper'

RSpec.describe MyCustomSirenSerializer do
  let(:siren) { MyCustomSirenSerializer.new.to_siren }

  it { should have_class("MyCustomSiren") }

  it { should have_entities.with_class("MySubEntity").exactly(2) }

  it { should have_link_with_rel("my-rel") }

  it { should have_property("myProperty").with_value("myValue") }

  it { should have_action("action_name") }
end
```


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
