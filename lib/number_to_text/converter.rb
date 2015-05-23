module NumberToText
  class Converter
    attr_reader :number, :opts

    def self.convert(number, options)
      new(number, options).execute
    end

    def initialize(number, options)
      @number = number
      @opts   = options
    end

    def convert # :nodoc:
      @number = Integer(number)

      return 'null' if @number == 0

      digits = 0
      result = ''

      while @number > 0
        if @number % 1000 > 0
          result = [to_text_1000(@number % 1000, digits), digits_to_text(digits, @number % 1000 > 1), result].join
        end
        @number /= 1000
        digits += 3
      end

      result.strip
    end

    def execute
      if !number
        nil
      else
        convert
      end
    end

    private
      def to_text_10(num)
        num = num.to_i / 10
        case num
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

      def to_text_100(num, digits)
        num = num % 100

        if num == 1
          case digits
          when 0
            return 'eins'
          when 1..3
            return 'ein'
          when 6, 9, 12, 15
            if num == 1
              return 'eine'
            else
              return 'ein'
            end
          end
        end

        if num.between?(2, 19)
          case num
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
        elsif num.between?(20, 99)
          if num % 10 == 0
            to_text_10(num)
          else
            to_text_100(num % 10, 1) + 'und' + to_text_10(num)
          end
        end
      end

      def to_text_1000(num, digits)
        if num / 100 == 0
          to_text_100(num, digits)
        else
          to_text_100(num / 100, 2) + 'hundert' + to_text_100(num, digits)
        end
      end

      def digits_to_text(digits, mz)
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
  end
end
