module HangmanPrinter
  def print_hangman(lvl)
    lvls = (0..lvl)
    lvl_chars = {1=>(lvls.include? 1) ? "|" : " ",
                 2=>[(lvls.include? 2) ? "_" : " ", (lvls.include? 2) ? "\\" : " "],
                 3=>(lvls.include? 3) ? "|" : " ",
                 4=>(lvls.include? 4) ? "\u2B24" : " ",
                 5=>(lvls.include? 5) ? "|" : " ",
                 6=>(lvls.include? 6) ? "-" : " ",
                 7=>(lvls.include? 7) ? "-" : " ",
                 8=>(lvls.include? 8) ? "/" : " ",
                 9=>(lvls.include? 9) ? "\\" : " ",}

    puts "\t     #{ lvl_chars[2][0]*7 }"
    puts "\t     #{ lvl_chars[3] }   #{ lvl_chars[2][1] } #{ lvl_chars[1] }"
    puts "\t     #{ lvl_chars[3] }    #{ lvl_chars[2][1] }#{ lvl_chars[1] }"
    puts "\t    #{ lvl_chars[4] }      #{ lvl_chars[1] }"
    puts "\t  #{ lvl_chars[6]*3 }#{ lvl_chars[5] }#{ lvl_chars[7]*3 }  #{ lvl_chars[1] }"
    puts "\t     #{ lvl_chars[5] }     #{ lvl_chars[1] }"
    puts "\t    #{ lvl_chars[8] } #{ lvl_chars[9] }    #{ lvl_chars[1] }"
    puts "\t   #{ lvl_chars[8] }   #{ lvl_chars[9] }   #{ lvl_chars[1] }"
    puts "\t           #{ lvl_chars[1] }"
    puts "\t___________#{ lvl_chars[1] }"
  end

  def print_screeen(_word, _letters, lvl)
    clear_screen
    print_hangman(lvl)
    print "\n\n"
    print_word(_word, _letters)
  end

  def clear_screen
    RUBY_PLATFORM =~ /win32|win64|\.NET|windows|cygwin|mingw32/i ? system("cls") : system("clear")
  end

  def print_word(word, letters)
    print "\t"

    word.split("").each do |char|
      print " #{ (@letters.include? char) ? char : "_" } "
    end

    print "\n\n"
    print "    #{@letters.join("  ")}"
    print "\n\n"
  end

  private :print_word
end
