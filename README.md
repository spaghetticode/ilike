# Ilike

Stop hardcoding sql for LIKE and ILIKE queries in your application.

This gem adds the `ilike` method to your activerecord toolbelt, allowing to
write code that doesn't depend explicitly on your db adapter:

```ruby
  class Product < ActiveRecord::Base; end

  Product.create(:name => 'Pinot wine', :origin => 'France', :price => 13.50)
  Product.create(:name => 'Barolo wine', :origin => 'Italy', :price => 12.50)

  # basic search:
  Product.ilike(:name => '%wine')
  # => [#<Product id: 2, name: "Pinot wine", origin: "France", price: #<BigDecimal:105b70880,'0.135E2',18(18)>>,
        #<Product id: 3, name: "Barolo wine", origin: "Italy", price: #<BigDecimal:105b705d8,'0.125E2',18(18)>>]

  # search on multiple fields:
  Product.ilike(:name => '%wine%', :origin => '%Ita%')
  # => [#<Product id: 3, name: "Barolo wine", origin: "Italy", price: #<BigDecimal:1059677a0,'0.125E2',18(18)>>]

  # search with multiple keywords on the same field:
  Product.ilike(:name => ['%wine', '%barolo%'])
  # => [#<Product id: 3, name: "Barolo wine", origin: "Italy", price: #<BigDecimal:1059fe998,'0.125E2',18(18)>>]
```


## Installation

Add this line to your application's Gemfile:

    gem 'ilike'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ilike


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
