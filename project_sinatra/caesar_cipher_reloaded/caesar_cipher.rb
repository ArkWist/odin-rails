require 'sinatra'

def caesar_cipher(text, shift)
  code = text.each_char.map { |letter| letter = encode(letter, shift) }
  code.join
end

def encode(letter, shift)
  letter = if letter.between?("a", "z") then bounded_shift(letter, shift, "a", "z")
        elsif letter.between?("A", "Z") then bounded_shift(letter, shift, "A", "Z")
        else letter end
  letter
end

def bounded_shift(letter, shift, range_a, range_z)
  shift = (shift % (range_z.ord - range_a.ord + 1)).to_i # Normalizes extra long shifts
  letter = (letter.ord + shift).chr
  if letter.ord > range_z.ord then 
    shift = letter.ord - range_z.ord - 1
    letter = (range_a.ord + shift).chr
  end
  letter
end

get '/' do
  starting = params["starting"]
  shift = params["shift"]
  if !starting.nil? && !shift.nil?
    encoded = caesar_cipher(starting, shift.to_i)
  end
  erb :index, :locals => {:starting => starting, :shift => shift, :encoded => encoded}
end
