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
        t.string  :name,   :null => false
        t.string  :origin, :null => false
        t.decimal :price,  :null => false
      end
    end
  end

  before do
    Product.delete_all
    @pasta  = Product.create(:name => 'Spaghetti Pasta', :origin => 'Italy', :price => 1.00)
    @pinot  = Product.create(:name => 'Pinot wine', :origin => 'France', :price => 13.50)
    @barolo = Product.create(:name => 'Barolo wine', :origin => 'Italy', :price => 12.50)
  end

  it 'finds records that end with the requested string' do
    Product.ilike(:name => '%pasta').should == [@pasta]
  end

  it 'finds records that end with the requested string' do
    Product.ilike(:name => '%pasta').should == [@pasta]
  end

  it 'finds records that contain the requested string' do
    Product.ilike(:name => '%olo%').should == [@barolo]
  end

  it 'finds records that match all matchers' do
    Product.ilike(:name => '%wine', :origin => '%fra%').should == [@pinot]
  end

  it 'searches with all options' do
    Product.ilike(:name => ['%wine%', '%barolo%']).should == [@barolo]
  end

  it 'builds the expected sql' do
    sql = 'SELECT "products".* FROM "products"  WHERE ("products"."name" LIKE \'%wine%\' AND "products"."name" LIKE \'%barolo%\')'
    Product.ilike(:name => ['%wine%', '%barolo%']).to_sql.should == sql
  end
end
