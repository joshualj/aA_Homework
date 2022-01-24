require_relative "code"

class Mastermind
    def initialize(length)
        @secret_code = Code.random(length)
    end

    def print_matches(code_inst)
        puts "exact matches: #{@secret_code.num_exact_matches(code_inst)}"
        puts "near matches: #{@secret_code.num_near_matches(code_inst)}"
    end

    def ask_user_for_guess
        puts "Enter a code "
        response = gets.chomp
        new_c = Code.from_string(response)
        print_matches(new_c)
        return @secret_code == new_c
    end
end
