#create a class called hangman

class Hangman
#create an initialize method
    def  initialize
        #to be able to access the wor , we change them to instance variables
        #create an array of letters
        @letters = ('a'..'z').to_a
        #sample() is an array method which returns a random element or n random elements from an array
        #to ensure we remove the letter a user inputs whether its correct or not, to allow user to know which characters they can use
        #to ensure the words are randomly picked (https://www.geeksforgeeks.org/ruby-array-sample-function/)
        @word = words.sample
        #to allow a limited number of guesses
        @lives = 7
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

    def print_teaser
        word_teaser = ""

        #https://www.rubyguides.com/ruby-tutorial/loops/#tab-con-9
        # we use size to get number of characters in the string and times to run the script as many of those times

        @word.first.size.times do
            word_teaser += "_ "
        end
        puts word_teaser
    
    end

    def make_guess
        if lives > 0
            puts "Enter a letter"
            #we use a chomp method to return a new String with a separator removed from the end of the string e.g \n,\r (https://www.geeksforgeeks.org/ruby-string-chomp-method/#:~:text=chomp!%20is%20a%20String%20class,default%20Ruby%20record%20separator%2C%20t.)
            #create a new variable to capture input from user and get command to take value from our terminal
            #https://www.rubyguides.com/2019/10/ruby-chomp-gets/
            #we use chomp to remove the line break
            guess = gets.chomp

            #a conditional that checks if a letter from the guess is part of the word if it's included do something
            #we use include method to return a boolean if it's true of false
            good_guess = @word.first.include? guess

            if good_guess
                puts "Good guess!..you are correct"

                #showing new letter added to the word
                print_teaser
                make_guess
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

