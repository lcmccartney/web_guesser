require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER = rand(100) + 1

get '/' do

guess = params["guess"].to_i
message = check_guess(guess)
erb :index, :locals => {:message => message}

end

def check_guess(guess)
  if guess > SECRET_NUMBER + 5
    message = "way too high!"
  elsif guess < SECRET_NUMBER + 5 && guess > SECRET_NUMBER
    message = "too high!"
  elsif guess > SECRET_NUMBER - 5 && guess < SECRET_NUMBER
    message = "too low!"
  elsif guess < SECRET_NUMBER - 5
    message = "way too low!"
  elsif guess == SECRET_NUMBER
    message = "correct! Yay!"
  end
end
