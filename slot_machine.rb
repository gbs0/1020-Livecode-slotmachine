class SlotMachine

   
    def initialize
        @symbol = ["joker", "star", "cherry", "seven", "bell"]
        @reel1 = @symbol.sample
        @reel2 = @symbol.sample
        @reel3 = @symbol.sample
    end

    def push 
      [@reel1, @reel2, @reel3]
    end

    def score(result)
       number = three_diff(result)
       if number.nil?
         number = three_equals(result)
         if number.nil?
            number = two_equals(result)
         end
       end
       number
    end

    def three_diff(result)
        if result[0] != result[1] && result[1] != result[2] && result[0] != result[2]
            check = 0
        end
    end

    def two_equals(result)
        if result[0] == result[1] || result[1] == result[2] || result[0] == result[2]
            if result.include?('joker')
                pair = result.reject { |element| element == 'joker' }
                if pair.size == 1
                    25
                else
                    case pair[0] 
                    when "star"
                        20
                    when "bell"
                        15
                    when "seven"
                        10
                    when "cherry"
                        5
                    end
                end
            end
        end
    end
    

    def three_equals(result)   
      if result[0] == result[1] && result[1] == result[2] && result[0] == result[2]
        case result[0] 
        when "joker"
            50
        when "star"
            40
        when "bell"
            30
        when "seven"
            20
        when "cherry"
            10
        end
      end
    end
end