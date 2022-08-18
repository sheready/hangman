#create a class called hangman

Class Hangman
#create an initialize method
    def  initialize
        #to be able to access the wor , we change them to instance variables
        #create an array of letters
        letters = ('a'..'z').to_a
        #sample() is an array method which returns a random element or n random elements from an array
        #to ensure we remove the letter a user inputs whether its correct or not, to allow user to know which characters they can use
        #to ensure the words are randomly picked
        word = words.sample
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
    #create a class for user to start a game by typing a letter and also receive a clue for the word they are quessing
    def begin
        puts "New game started ... your clue is #{ }"
    end

end
