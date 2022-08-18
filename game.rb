#create a class called hangman

class Hangman
#create an initialize method
    def  initialize
        #to be able to access the wor , we change them to instance variables by adding @
        #create an array of letters
        #sample() is an array method which returns a random element or n random elements from an array
        #to ensure we remove the letter a user inputs whether its correct or not, to allow user to know which characters they can use
        #to ensure the words are randomly picked (https://www.geeksforgeeks.org/ruby-array-sample-function/)
        @word = words.sample
        #to allow a limited number of guesses
        @lives = 7
        @word_teaser = ""

        #https://www.rubyguides.com/ruby-tutorial/loops/#tab-con-9
        # we use size to get number of characters in the string and times to run the script as many of those times

        @word.first.size.times do
            @word_teaser += "_ "
        end
    end
    #Creating an array that allows us to pick a word
    def words
        [
            ["gossip", "casual or unconstrained conversation or reports about other people, typically involving details that are not confirmed as being true."],
            ["zombie", "a corpse said to be revived by witchcraft"],
            ["nightclub", "an entertainment venue that is open from the evening until early morning"],
            ["bookworm", "a person who enjoys reading"]
        ]
    end
    #pass in the last letter used has  input as a variable
    def print_teaser last_guess = nil

        #add a new method to update teaser only when the last guess value is not nill
        update_teaser(last_guess) unless last_guess.nil?
       
        puts @word_teaser
    
    end

    #create update teaser method
    def update_teaser last_guess
        #we split it based on the space of each underscore and create an array. https://www.geeksforgeeks.org/ruby-string-split-method-with-examples/

        new_teaser = @word_teaser.split
        #the value will look like ['_','_']
        #to iterate over the teaser array https://www.geeksforgeeks.org/ruby-enumerator-each_with_index-function/
        new_teaser.each_with_index do |letter, index|
            #replace the blank values with guessed letter if matches letter in word 
            #we check if the character is blank and if the word has a character in the index and if it matches to the letter we are passing in i.e last guess

            if letter == '_' && @word.first[index] == last_guess
                #if there's a match it will update with the letter the user has guessed
                new_teaser[index] = last_guess
            end
        end
        #let's override the @word_teaser method with the new teaser value
        @word_teaser = new_teaser.join(' ')
    end

    

    def make_guess
        if @lives > 0
            puts "Enter a letter"
            #we use a chomp method to return a new String with a separator removed from the end of the string e.g \n,\r (https://www.geeksforgeeks.org/ruby-string-chomp-method/#:~:text=chomp!%20is%20a%20String%20class,default%20Ruby%20record%20separator%2C%20t.)
            #create a new variable to capture input from user and get command to take value from our terminal
            #https://www.rubyguides.com/2019/10/ruby-chomp-gets/
            #we use chomp to remove the line break
            guess = gets.chomp

            #a conditional that checks if a letter from the guess is part of the word if it's included do something
            #we use include method to return a boolean if it's true of false
            good_guess = @word.first.include? guess

            #check if user input has the word exit
            if guess == "exit"
                puts "Thank you for playing!"
            elsif good_guess
                puts "Good guess!..you are correct"

                #storing the correct letter guessed


                #showing new letter added to the word
                #the leetr passed in by user will be shown on this method

                print_teaser guess

                #check teaser word matches actual word we are trying to guess,first remove spaces using split
                #split makes the word to be an array hence we make it into a string using the join method
                if @word.first == @word_teaser.split.join
                    puts "Congratulations... you have won this round"
                else 
                    make_guess
                end
            else
                #reduce number of lives if gues is wrong
                @lives -= 1
                puts "Sorry... you have #{ @lives } lives left. try again"
                #allow user to make another guess until lives = 0
                make_guess
            end
        else
            puts "Game over! Better luck next time"
        end



    end
    #create a class for user to start a game by typing a letter and also receive a clue for the word they are quessing
    def begin
        #get number of characters in the new word
        puts "New game started ... your word is #{ @word.first.size } characters long"

        puts "To exit game at any point type 'exit'"
        #calling the teaser method 
        print_teaser

        puts "The clue is: #{ @word.last }"
        #give the user a prompt for inputting a letter

        #calling make guess method
        make_guess
    end

end

game = Hangman.new
game.begin

