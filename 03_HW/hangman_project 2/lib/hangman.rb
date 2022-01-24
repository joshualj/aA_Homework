class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]

  def self.random_word
    return DICTIONARY.sample
  end

  def initialize
    @secret_word = Hangman.random_word
    @guess_word = @secret_word.each_char.map {|char| '_'}
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def guess_word
    @guess_word
  end

  def attempted_chars
    @attempted_chars
  end

  def remaining_incorrect_guesses
    @remaining_incorrect_guesses
  end

  def already_attempted?(char)
    return @attempted_chars.include?(char)
  end

  def get_matching_indices(char)
    i_array = []
    @secret_word.each_char.with_index {|ele, i| i_array << i if ele == char}
    return i_array
  end

  def fill_indices(char, arr)
    arr.each {|ele| @guess_word[ele] = char}
  end

  def try_guess(char)
    if self.already_attempted?(char)
       print 'that has already been attempted'
       return false
    else
      @attempted_chars << char
      if self.get_matching_indices(char).length == 0
        @remaining_incorrect_guesses -= 1
      else
        self.fill_indices(char, self.get_matching_indices(char))
      end
      return true
    end
  end

  def ask_user_for_guess
    puts "Enter a char:"
    response = gets.chomp
    return self.try_guess(response)
  end

  def win?
    if @guess_word.join("") == @secret_word
      puts "WIN"
      return true
    else
      return false
    end
  end

  def lose?
    if @remaining_incorrect_guesses == 0
      puts "LOSE"
      return true
    else
      return false
    end
  end

  def game_over?
    if self.win? || self.lose?
      puts @secret_word
      return true
    else
      return false
    end
  end

end
