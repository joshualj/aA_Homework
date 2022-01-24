require 'byebug'

class Code
  attr_reader :pegs   #previously had attr_accessor

  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  def self.valid_pegs?(charr)
    charr.all? {|ele| POSSIBLE_PEGS.has_key?(ele.upcase)}
  end

  def initialize(charr)
    raise "error, does not contain valid pegs" if !Code.valid_pegs?(charr)
    @pegs = charr.map {|char| char.upcase}
  end

  # def pegs
  #   @pegs
  # end

  def self.random(length)
    new_arr = []
    length.times do
      new_arr << POSSIBLE_PEGS.keys[rand(0...POSSIBLE_PEGS.length)] #solution has POSSIBLE_PEGS.keys.sample
    end
    Code.new(new_arr)
  end

  def self.from_string(pegs)
    Code.new(pegs.split(""))
  end

  def [](idx)
    return @pegs[idx]
  end

  def length
    return @pegs.length
  end

  def num_exact_matches(guess)
    exact_c = 0
    guess.pegs.each_index {|i| exact_c += 1 if guess.pegs[i] == @pegs[i]}
    return exact_c
  end

  def num_near_matches(guess)
    near_c = 0
    new_guess = []
    new_pegs = []
    guess.pegs.each_index do |i|
      if guess.pegs[i] != @pegs[i]
        new_guess << guess.pegs[i]
        new_pegs << @pegs[i]
      end
    end
    new_guess.each_index do |i|
      if new_pegs.include?(new_guess[i]) #need to remove letter from pegs after it is added
        near_c += 1
        setter = false
        while setter == false
          new_pegs.each_index do |j|
            if new_pegs[j] == new_guess[i]
              new_pegs.delete_at(j)
              setter = true
            end
          end
        end
      end
    end
    return near_c
  end

  def ==(code_inst)
    return self.pegs == code_inst.pegs
  end

end
