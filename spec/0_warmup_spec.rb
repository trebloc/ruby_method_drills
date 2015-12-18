# THIS FILE PERFORMS RSPEC TESTS ON `drills.rb`
# TO RUN YOUR TESTS TYPE: `rspec spec/0_warmup_spec.rb`

# require "./solutions/warmup.rb"   # use this line to see passing tests
require "./drills.rb"              # use this line to test your code

################
#### WARMUP ####
################

describe "#triple" do
  it "multiplies a given number by three" do
    expect( triple(1) ).to eq 3
    expect( triple(-1) ).to eq -3
  end
end

describe "#quadruple" do
  it "multiplies a given number by four" do
    expect( quadruple(1) ).to eq 4
    expect( quadruple(-1) ).to eq -4
  end
end
