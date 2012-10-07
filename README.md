# Ilike

Stop hardcoding sql for LIKE and ILIKE queries in your application.

This gem adds the `ilike` method to your activerecord toolbelt, allowing to
write code that doesn't depend explicitly on your db adapter:

```ruby
  class Product < ActiveRecord::Base; end

  Product.create(:name => 'Mozzarella Cheese', :price => 1.50)
  Product.ilike(:name => '%cheese')
  => [#<Product id: 2, name: "Mozzarella Cheese", price: #<BigDecimal:7fdeab856c90,'0.15E1',18(18)>>]
```


## Installation

Add this line to your application's Gemfile:

    gem 'ilike'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install liker

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
