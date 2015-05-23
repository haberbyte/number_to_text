require 'number_to_text/version'

module NumberToText
  def self.num_to_text_10(number)
    number = number.to_i / 10
    case number
    when 1 then 'zehn'
    when 2 then 'zwanzig'
    when 3 then 'dreißig'
    when 4 then 'vierzig'
    when 5 then 'fünfzig'
    when 6 then 'sechzig'
    when 7 then 'siebzig'
    when 8 then 'achtzig'
    when 9 then 'neunzig'
    end
  end

  def self.num_to_text_100(number, digits)
    number = number % 100

    if number == 1
      case digits
      when 0
        return 'eins'
      when 1..3
        return 'ein'
      when 6, 9, 12, 15
        if number == 1
          return 'eine'
        else
         return 'ein'
       end
      end
    end

    if (number >= 2) && (number <= 19)
      case number
      when 2 then return 'zwei'
      when 3 then return 'drei'
      when 4 then return 'vier'
      when 5 then return 'fünf'
      when 6 then return 'sechs'
      when 7 then return 'sieben'
      when 8 then return 'acht'
      when 9 then return 'neun'
      when 10 then return 'zehn'
      when 11 then return 'elf'
      when 12 then return 'zwölf'
      when 13 then return 'dreizehn'
      when 14 then return 'vierzehn'
      when 15 then return 'fünfzehn'
      when 16 then return 'sechzehn'
      when 17 then return 'siebzehn'
      when 18 then return 'achtzehn'
      when 19 then return 'neunzehn'
      end
    elsif (number >= 20) && (number <= 99)
      if number % 10 == 0
        return num_to_text_10(number).to_s
      else
        return num_to_text_100(number % 10, 1).to_s + 'und' + num_to_text_10(number).to_s
      end
    end
  end

  def self.num_to_text_1000(number, digits)
    if number / 100 == 0
      return num_to_text_100(number, digits).to_s
    else
      return num_to_text_100(number / 100, 2).to_s + 'hundert' + num_to_text_100(number, digits).to_s
    end
  end

  def self.num_digits_to_text(digits, mz)
    if mz
      case digits
      when 0 then return ''
      when 3 then return 'tausend'
      when 6 then return ' Millionen '
      when 9 then return ' Milliarden '
      when 12 then return ' Billionen '
      when 15 then return ' Billiarden '
      end
    else
      case digits
      when 0 then return ''
      when 3 then return 'tausend'
      when 6 then return ' Million '
      when 9 then return ' Milliarde '
      when 12 then return ' Billion '
      when 15 then return ' Billiarde '
      end
    end
  end

  def self.convert(num)
    number = num.to_i
    digits = 0
    result = ''

    return 'null' if number == 0

    while number > 0
      result = (number % 1000 > 0 ? num_to_text_1000(number % 1000, digits).to_s + num_digits_to_text(digits, number % 1000 > 1).to_s : '') + result
      number /= 1000
      digits += 3
    end

    result.strip
  end
end