require_relative 'message_master'

class GuessChecker

  attr_reader :num, :guess, :correct
  attr_accessor :correct, :cheat
  def initialize(num, guess, cheat)
    @num = num
    @guess = guess.to_i
    @cheat = cheat
    @correct = false
  end

  def show_number
    "The secret number is #{num}!"
  end

  def correct?
    guess == num
  end

  def too_low?
    num > guess && num < (guess + 6)
  end


  def too_high?
    guess > num && guess < (num + 6)
  end

  def way_too_high?
     (guess - num) > 5
  end

  def way_too_low?
    (num - guess) > 5
  end

  def cheat?
    cheat == 'true'
  end

  def which_color
    if correct?
      color = 'green'
    elsif way_too_high?
      color = 'red'
    elsif way_too_low?
      color = 'red'
    elsif too_low?
      color = 'pink'
    elsif too_high?
      color = 'pink'
    end
  color
end

  def which_output
    mm = MessageMaster.new
    if correct?
      message = mm.correct_message
      @correct = true
    elsif way_too_high?
      message = mm.way_too_high_message
    elsif way_too_low?
      message = mm.way_too_low_message
    elsif too_low?
      message = mm.too_low_message
    elsif too_high?
      message = mm.too_high_message
    end
  message
end



end
