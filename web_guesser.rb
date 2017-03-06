require 'sinatra'
require 'sinatra/reloader'
require_relative 'guess_checker'
require_relative 'message_master'
require 'pry'

number = rand(100)
get '/' do
  if params['guess'].nil?
      message = "Make a guess!"
      erb :index, :locals => {:message => message, :correct => false, :cheat => false, :color => 'orange'}
  else
    gc = GuessChecker.new(number, params['guess'], params['cheat'])
    message = gc.which_output
    erb :index, :locals => {:message => message,
                            :correct => gc.correct,
                            :show_number => gc.show_number,
                            :cheat => gc.cheat?,
                            :color => gc.which_color}
  end
end
