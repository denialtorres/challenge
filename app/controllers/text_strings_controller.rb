class TextStringsController < ApplicationController
    
    def message_function
        session[:body] = palindrome_verify(params[:body])
        redirect_to root_url
    end
    
    def message_shit
        @string = params[:body_two]
        session[:body_two] = valid_string?(@string)
        redirect_to root_url
    end
    
    def index
        
    end

private
    def palindrome_verify(word)
        if word.reverse == word #Check if string same when reversed 
            return "#{ word } is a palindrome."
          else # If string is not the same when reversed
            return "#{ word } is not a palindrome."
        end
    end
    
    def valid_string?(string)
       #assume validity
      @valid = true
      #empty array will be populated inside the loop
      @open_characters = []
      #set up a hash to translate the open character to a closing character
      translate_open_closed = {"{" => "}","["=>"]","("=>")"}
      #create an array from the string loop through each item 
      string.split('').each do |e| 
        #adding it to the open_characters array if it is an opening character
        @open_characters << e if e=~ /[\[\{\(]/
        #if it is a closing character then translate the last open_character to 
        #a closing character and compare them to make sure characters are closed in order
        #the result of this comparison is applied to the valid variable
        @valid &= e ==  translate_open_closed[@open_characters.pop] if e=~ /[\]\}\)]/
      end
      #return validity and make sure all open characters have been matched
      @valid &= @open_characters.empty?
      return @valid
    end 

end

