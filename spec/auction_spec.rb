require 'pry'
require 'rspec'
require './lib/auction'

describe Auction do
  before :each do

  end

  it 'exists' do
    auction = Auction.new
    expect(auction).to be_an Auction
  end
end