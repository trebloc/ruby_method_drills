# THIS FILE PERFORMS RSPEC TESTS ON `drills.rb`
# TO RUN YOUR TESTS TYPE: `rspec spec/3_iterator_spec.rb`

# require "./solutions/iterators.rb"   # use this line to see passing tests
require "./drills.rb"              # use this line to test your code


###########################
#### LOOPS & ITERATORS ####
###########################

describe "#count_spaces" do
  it "counts the spaces in a string" do
    space = "\s"
    tab = "\t"
    expect( count_spaces(space*1) ).to eq 1
    expect( count_spaces(tab+space*10+tab) ).to eq 10
    expect( count_spaces("") ).to eq 0
    expect( count_spaces(" | | ") ).to eq 3
  end
end

#1
def count_spaces(str)
  count = 0
  space = " "
  str.each_char do |char|
    if char == space
      count += 1
    end
  end
  count
end

describe "#string_lengths" do
  it "converts a list of strings to a list of string lengths" do
    expect( string_lengths(["abc"]) ).to eq [3]
    expect( string_lengths([""]) ).to eq [0]
    expect( string_lengths(["abc", "a", "123456"]) ).to eq [3, 1, 6]
  end
end

#2
def string_lengths(list)
  list.map {|str| str.length }
end

describe "#remove_falsy_values" do
  it "filters out falsy values from a list" do
    expect( remove_falsy_values(["hi"]) ).to eq ["hi"]
    expect( remove_falsy_values([]) ).to eq []
    expect( remove_falsy_values([nil]) ).to eq []
    expect( remove_falsy_values([false]) ).to eq []
    expect( remove_falsy_values([10,"hi"]) ).to eq [10,"hi"]
    expect( remove_falsy_values([0, "", nil, false, -1]) ).to eq [0,"",-1]
  end
end

#3
def remove_falsy_values(list)
  list.select { |item| !!item }
end

describe "#exclude_last" do
  it "removes the last item from an array" do
    expect( exclude_last([1,2,3]) ).to eq [1,2]
    expect( exclude_last([1,2]) ).to eq [1]
    expect( exclude_last([1]) ).to eq []
  end

#4
def exclude_last(sequence)
  sequence[0..-2]
end  

  it "removes the last item from a string" do
    expect( exclude_last("123") ).to eq "12"
    expect( exclude_last("12") ).to eq "1"
    expect( exclude_last("1") ).to eq ""
  end
end

describe "#exclude_first" do
  it "removes the first item from an array" do
    expect( exclude_first([1,2,3]) ).to eq [2,3]
    expect( exclude_first([1,2]) ).to eq [2]
    expect( exclude_first([1]) ).to eq []
  end

#5
def exclude_first(sequence)
  sequence[1..-1]
end  

  it "removes the first character from a string" do
    expect( exclude_first("123") ).to eq "23"
    expect( exclude_first("12") ).to eq "2"
    expect( exclude_first("1") ).to eq ""
  end

  it "does not alter the original input (non-destructive)" do
    input_array = [1,2,3]
    exclude_first(input_array)
    expect( input_array.length ).to eq 3

    input_string = "123"
    exclude_first(input_string)
    expect( input_string.length ).to eq 3
  end
end

describe "#exclude_ends" do
  it "removes the first and last items from an array" do
    expect( exclude_ends([1,2,3]) ).to eq [2]
    expect( exclude_ends([1,2]) ).to eq []
  end

  it "removes the first and last characters from a string" do
    expect( exclude_ends("123") ).to eq "2"
    expect( exclude_ends("12") ).to eq ""
  end
end

#6 Didn't quite understand this.
def exclude_ends(sequence)
  sequence[1..-2]
end

describe "#select_every_even" do
  it "returns a list of even-indexed items" do
    expect( select_every_even([0,1,2]) ).to eq [0,2]
    expect( select_every_even(["a","b","c","d","e"]) ).to eq ["a","c","e"]
  end
end

#7
def select_every_even(list)
  list.select.with_index {|item, index| item if index.even? }
end

describe "#select_every_odd" do
  it "returns a list of odd-indexed items" do
    expect( select_every_odd([0,1,2]) ).to eq [1]
    expect( select_every_odd(["a","b","c","d","e"]) ).to eq ["b","d"]
  end
end

#8
def select_every_odd(list)
  list.select.with_index {|item, index| item if index.odd? }
end

describe "#select_every_n" do
  it "returns a list of items at an index evenly divisible by n" do
    expect( select_every_n(["a","b","c","d","e"], 3) ).to eq ["a","d"]
    expect( select_every_n(["a","b","c","d","e"], 4) ).to eq ["a","e"]
  end

  it "defaults to an n value of 1" do
    expect( select_every_n([0,1,2]) ).to eq [0,1,2]
  end
end

#9
def select_every_n(list, interval=1)
  list.select.with_index {|item, index| item if index%interval == 0 }
end

describe "#compile_agenda" do
  item1 = {
    title: "Learn about Ruby",
    priority: 0
  }

  item2 = {
    title: "Try to take over the world",
    priority: 1
  }

  item3 = {
    title: "Build a game in ruby",
    priority: 3
  }

  it "compiles a list of agenda items into one bulleted string" do
    expect( compile_agenda( [item1] ) ).to match /Learn about Ruby/
    expect( compile_agenda( [item1] ) ).to eq "* Learn about Ruby"
  end

  it "adds line breaks between agenda items" do
    expect( compile_agenda( [item1, item2] ) ).to eq "* Learn about Ruby\n* Try to take over the world"
  end

  it "displays items sorted by priority, descending (by default)" do
    expect( compile_agenda( [item2, item1] ) ).to eq "* Learn about Ruby\n* Try to take over the world"
  end

  it "can optionally display items sorted by priority ascending" do
    expect( compile_agenda( [item1, item2, item3], order="ASC" ) ).to eq "* Build a game in ruby\n* Try to take over the world\n* Learn about Ruby"
  end

  it "can optionally change the bullet to a different string" do
    expect( compile_agenda( [item1, item2, item3], order="ASC", bullet="~" ) ).to eq "~ Build a game in ruby\n~ Try to take over the world\n~ Learn about Ruby"
  end
end

#10
def compile_agenda(agenda_items, order="DESC", bullet="*")
  sorted_agenda_items = agenda_items.sort_by {|o| o[:priority] }
  sorted_agenda_items.reverse! if order == "ASC"
  sorted_agenda_items.map {|o| "#{bullet} #{o[:title]}"  }.join("\n")
end
