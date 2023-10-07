#method converts an integer to a Roman numeral
def int_to_roman(num)
  roman = {
    1000 => 'M',
    900 => 'CM',
    500 => 'D',
    400 => 'CD',
    100 => 'C',
    90 => 'XC',
    50 => 'L',
    40 => 'XL',
    10 => 'X',
    9 => 'IX',
    5 => 'V',
    4 => 'IV',
    1 => 'I'
  }

  result = ''
  #we go through the dictionary, checking the value with the entered number
  roman.each do |value, letter|
    while num >= value
      result += letter
      num -= value
    end
  end
  result
end

#method converts a Roman numeral to an integer
def roman_to_int(num)
  roman = {
    'M' => 1000,
    'D' => 500,
    'C' => 100,
    'L' => 50,
    'X' => 10,
    'V' => 5,
    'I' => 1
  }
  result = 0
  prev_num = 0

  #we start with the symbol on the right and find the corresponding meaning in the 'roman'
  num.reverse.each_char do |char|
    value = roman[char]
    #then we compare it with the previous value to know whether it is necessary to add or subtract
    if value < prev_num
      result -= value
    else
      result += value
    end

    prev_num = value
  end
  result
end

if ARGV.empty?
  puts "Enter a Roman numeral (I..MMMM) or an integer (1..4000)"
  exit
end

num = ARGV[0]

if num.match?(/^\d+$/)
  num = num.to_i
  if num >=1 && num<=4000
    result = int_to_roman(num)
    puts "=> #{result}"
  else
    puts "The number #{num} is not in the range 1..4000"
  end
elsif num.match?(/^[IVXLCDM]+$/)  #?whether the string consists of I, V, X, L, C, D, and M
  result = roman_to_int(num)
  puts "=> #{result}"
else
  puts "Incorrectly entered data"
end