require 'pry'
require 'rspec'
require './lib/item'

describe Item do
  before :each do

  end

  it 'exists' do
		item1 = Item.new('Chalkware Piggy Bank')
    expect(item1).to be_an Item
  end
