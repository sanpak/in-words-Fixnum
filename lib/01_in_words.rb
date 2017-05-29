class Fixnum
  def in_words
    number = self
    return "Please enter a number that is not negative." if number < 0
    return 'zero' if number == 0

    numString = ''
    onesPlace = ['one',     'two',       'three',    'four',     'five',
               'six',     'seven',     'eight',    'nine']
    tensPlace = ['ten',     'twenty',    'thirty',   'forty',    'fifty',
               'sixty',   'seventy',   'eighty',   'ninety']
    teenagers = ['eleven',  'twelve',    'thirteen', 'fourteen', 'fifteen',
               'sixteen', 'seventeen', 'eighteen', 'nineteen']
    #don't need these stuff
    # hundreds_array = ['one hundred','two hundred','three hundred','four hundred',
    #             'five hundred','six hundred','seven hundred','eight hundred','nine hundred']
    # thousands_array = ['one thousand','two thousand','three thousand','four thousand','five thousand',
    #               'six thousand','seven thousand','eight thousand','nine thousand']
    # millions_array = ['one million','two million','three million','four million','five million','six million',
    #             'seven million','eight million','nine million']
    # billions_array = ['one billion','two billion','three billion','four billion','five billion','six billion',
    #             'seven billion','eight billion','nine billion']
    # trillions_array = ['one trillion','two trillion','three trillion','four trillion','five trillion','six trillion',
    #               'seven trillion','eight trillion','nine trillion']
    left = number
    #trillions
    write = left/1000000000000
    left = left - write * 1000000000000

    if write > 0
      trillions = write.in_words
      numString = numString + trillions + ' trillion'
      if left > 0
        numString = numString + ' '
      end
    end
    #billions
    write = left / 1000000000
    left = left - write * 1000000000

    if write > 0
      billions = write.in_words
      numString = numString + billions + ' billion'
      if left > 0
        numString = numString + ' '
      end
    end
    #million
    write = left / 1000000
    left = left - write * 1000000

    if write > 0
      millions = write.in_words
      numString = numString + millions + ' million'
      if left > 0
        numString = numString + ' '
      end
    end
    #thousand
    write = left / 1000
    left = left - write * 1000

    if write > 0
      thousands = write.in_words
      numString = numString + thousands + ' thousand'
      if left > 0
        numString = numString + ' '
      end
    end
    #hundred
    write = left / 100
    left = left - write * 100
    if write > 0
      hundred = write.in_words
      numString = numString + hundred + ' hundred'
      if left > 0
        numString = numString + ' '
      end
    end
    #tens
    write = left / 10
    left  = left - write * 10
    if write > 0
      if ((write == 1) && (left > 0))
        numString = numString + teenagers[left-1]
        left = 0
      else
        numString = numString + tensPlace[write-1]
      end

      if left > 0
        numString = numString + ' '
      end
    end
    write = left
    left = 0

    if write > 0
      numString = numString + onesPlace[write-1]
    end
    #result
    numString
  end
end


  #a different way to tackle.
  # def single_digits
  #   @single_digit = { 1 => "one", 2 => "two", 3 => "three" , 4 => "four", 5 => "five",
  #                   6 => "six", 7 => "seven", 8 => "eight" , 9 => "nine" }
  # end
  #
  # def ten_to_twelve
  #   @ten_to_twelve = { 10 => "ten" , 11 => "eleven", 12 => "twelve" }
  #
  # end
  #
  # def teens
  #   @teens = { 13 => "thirteen", 14 => "fourteen", 15 => "fifteen", 16 => "sixteen" , 17 => "seventeen" ,
  #             18 => "eighteen", 19 => "nineteen"},
  #
  # end
  #
  # def tens
  #   @tens = { 20 => "twenty", 30 => "thrity", 40 => "forty", 50 => "fifty", 60 => "sixty",
  #           70 => "seventy" , 80 => "eighty", 90 => "ninty" }
  # end
  #
  # def hundred
