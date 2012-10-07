require 'spec_helper'

class Product < ActiveRecord::Base; end

describe Ilike do
  before :all do
    ActiveRecord::Base.establish_connection(
      :adapter => 'sqlite3',
      :database => ':memory:'
    )
    ActiveRecord::Schema.define do
      create_table :products do |t|
        t.string  :name,  :null => false
        t.decimal :price, :null => false
      end
    end
  end

  before do
    Product.delete_all
    @pasta  = Product.create(:name => 'Spaghetti Pasta', :price => 1.00)
    @cheese = Product.create(:name => 'Mozzarella Fresh Cheese', :price => 1.50)
  end

  it 'finds records that end with the requested string' do
    Product.ilike(:name => '%pasta').should == [@pasta]
  end

  it 'finds records that contain the requested string' do
    Product.ilike(:name => '%cheese%').should == [@cheese]
  end
end
