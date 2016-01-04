# THIS FILE PERFORMS RSPEC TESTS ON `drills.rb`
# TO RUN YOUR TESTS TYPE: `rspec spec/4_hash_spec.rb`

# require "./solutions/hashes.rb"   # use this line to see passing tests
require "./drills.rb"              # use this line to test your code


##############################
#### MANIPULATING HASHES ####
##############################

describe "#character_count" do
  it "counts how many times each character appears in a string" do
    expect( character_count("a") ).to eq({"a"=> 1})
    expect( character_count("aaa") ).to eq({"a"=> 3})
    expect( character_count("aaabbb") ).to eq({"a"=> 3, "b"=> 3})
  end

  it "ignores case" do
    expect( character_count("A") ).to eq({"a"=>1})
    expect( character_count("aAa") ).to eq({"a"=>3})
    expect( character_count("aaAbbB") ).to eq({"a"=>3, "b"=>3})
  end
end

#1
def character_count(sentence)
  char_counts = {}
  sentence.each_char do |char|
    char = char.downcase
    if char_counts[char].nil?
      char_counts[char] = 1
    else
      char_counts[char] += 1
    end
  end
  char_counts
end

describe "#word_count" do
  it "counts how many times a word appears in a string" do
    expect( word_count("hi") ).to eq({"hi"=>1})
    expect( word_count("hi hi") ).to eq({"hi"=>2})
    expect( word_count("hi hi hello") ).to eq({"hi"=>2, "hello"=>1})
  end

  it "ignores case" do
    expect( word_count("Hi") ).to eq({"hi"=>1})
    expect( word_count("hi HI") ).to eq({"hi"=>2})
    expect( word_count("HI hi Hello") ).to eq({"hi"=>2, "hello"=>1})
  end

  it "ignores characters that are not in the sequence a-z" do
    expect( word_count("Hi!") ).to eq({"hi"=>1})
    expect( word_count("hi, HI.") ).to eq({"hi"=>2})
    expect( word_count("HI hi Hello!") ).to eq({"hi"=>2, "hello"=>1})
    expect( word_count("he-ll-o Hello123") ).to eq({"hello"=>2})
  end
end

#2
def word_count(sentence)
  word_counts = {}
  sentence.split(" ").each do |word|
    word = word.downcase.gsub(/[^a-z]/i, "")
    if word_counts[word].nil?
      word_counts[word] = 1
    else
      word_counts[word] += 1
    end
  end
  word_counts
end

describe "#most_frequent_word" do
  it "finds the word in a string that appears with the most frequency" do
    expect( most_frequent_word("you") ).to eq "you"
    expect( most_frequent_word("you be you") ).to eq "you"
    expect( most_frequent_word("be be be you be you") ).to eq "be"
  end
end

#3
def most_frequent_word(sentence)
  word_counts = word_count(sentence)
  word_counts.empty? ? nil : word_counts.invert.max[1]
end