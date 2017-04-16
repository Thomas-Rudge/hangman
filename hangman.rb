require_relative 'hangman_printer'
require_relative 'serializer'

class Game
  include BasicSerializer
  include HangmanPrinter

  def self.load
    data = File.exist?("savedata.json") ? File.open("savedata.json", "r") { |file| file.read } : ""

    if data.strip.length == 0
      puts "There is no saved data to load."
    else
      data = BasicSerializer.deserialize(data)

      self.new(data["@word"], data["@lvl"], data["@letters"]).play
    end
  end

  def initialize(*args)
    loaded = args.length == 3

    @word    = loaded ? args[0] : get_word
    @lvl     = loaded ? args[1] : 0
    @letters = loaded ? args[2] : Array.new
  end

  def play
    result = nil

    until result
      print_screeen(@word, @letters, @lvl)
      @guess = nil

      @letters << get_guess
      result    = get_result
    end
  end

  def get_word
    unless File.exist?("dictionary")
      raise "Error: Dictionary not found in working directory."
    end

    words = File.open("dictionary", "r") { |file| file.read }.split("\n")
    words.select! { |word| word.length >= 5 }

    words.sample.downcase
  end

  def get_guess
    puts "Pick a letter..."
    print "\t>>"
    response = gets.chomp.downcase.strip

    save   if response == "save"
    finish if response == "quit"

    if ("a".."z").include? response
      @lvl += 1 unless @word.split("").include? response
      response
    else
      puts "Bad response #{response}"
      get_guess
    end
  end

  def get_result
    case
    when @lvl == 9
      print_screeen(@word, @letters, @lvl)
      puts "GAME OVER!\nThe correct word was #{@word}."
      result = 0
    when (@word.split("") - @letters).length == 0
      print_screeen(@word, @letters, @lvl)
      puts "CONGRATULATIONS! YOU WIN!"
      result = 1
    else
      result = nil
    end

    result
  end

  def save
    data = serialize
    sfile = File.open("savedata.json", "w") { |file| file.write(data) }

    puts "Game saved."
    finish
  end

  def finish
    puts "Goodbye."
    exit
  end

  private :save, :finish, :get_result, :get_guess
end
