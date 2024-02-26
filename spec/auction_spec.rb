require 'pry'
require 'rspec'
require './lib/auction'
require './lib/item'

describe Auction do
  before :each do
    @auction = Auction.new
    @item1 = Item.new('Chalkware Piggy Bank')
    @item2 = Item.new('Bamboo Picture Frame')
  end

  it 'exists' do
    expect(@auction).to be_an Auction
  end

  it 'can add items to an array' do
    expect(@auction.items).to eq []

    @auction.add_item(@item1)
    @auction.add_item(@item2)

    expect(@auction.items).to eq [@item1, @item2]
  end
end