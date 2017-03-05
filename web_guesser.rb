require 'sinatra'
require 'sinatra/reloader'
require_relative 'guess_checker'
require_relative 'message_master'
require 'pry'

number = rand(100)
mm = MessageMaster.new

get '/' do
  if params['guess'].nil?
      message = "Make a guess!"
      erb :index, :locals => {:message => message, :correct => false}
  else
    gc = GuessChecker.new(number, params['guess'])
    message = gc.which_output
    erb :index, :locals => {:message => message, :correct => gc.correct, :show_number => gc.show_number}
  end
end
