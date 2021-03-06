require 'rubygems'
require 'data_mapper'

if ENV['ENVIRONMENT'] == 'test'
  DataMapper.setup(:test, "sqlite://#{Dir.pwd}/makers_bnb_test.rb")
else
  DataMapper.setup(:default, "sqlite://#{Dir.pwd}/makers_bnb.rb")
end

class Space

  attr_reader :name, :available

  include DataMapper::Resource

  property :id,           Serial
  property :name,         String
  property :description,  Text
  property :price,        String
  property :available,    Boolean, :default => true
  property :date,         String

  def self.add(name:, description:, price:, date:)
    Space.create(name: name, description: description, price: price, date: date)
  end

  def book(name)
    entry = Space.first(:name => name)
    entry.update(:available => false)
  end

end

DataMapper.finalize
DataMapper.auto_upgrade!
