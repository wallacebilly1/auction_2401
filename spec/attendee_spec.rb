require 'pry'
require 'rspec'
require './lib/attendee'

describe Attendee do
  before :each do

  end

  it 'exists' do
    attendee = Attendee.new({name: 'Megan', budget: '$50'})
    expect(attendee).to be_an Attendee
  end

end