=begin
Challenge Set 2: Hashes

Transform the following first hashes into the second entities:

{ a: 1, b: 2 } => { a: 2, b: 3 }
{ a: 2, b: 5, c: 1 } => { a: 1, b: 2, c: 5 }
{ a: 2, b: 5, c: 1 } => [1, 2, 5]
{ a: 1, b: 2, c: 3 } => { "1"=>"a", "2"=>"b", "3"=>"c" }
=end

class Test
  def self.assert_equals(expected,actual)
    expected == actual
  end
end

puts "1. { a: 1, b: 2 } => { a: 2, b: 3 }"
h = { a: 1, b: 2 }
expected = { a: 2, b: 3 }
try = h.map{|k,v|[k,v+=1]}.to_h
puts Test.assert_equals(expected,try)

puts "2. { a: 2, b: 5, c: 1 } => { a: 1, b: 2, c: 5 }"
h = { a: 2, b: 5, c: 1 }
expected = { a: 1, b: 2, c: 5 }
try = h.keys.zip(h.values.sort).to_h
puts Test.assert_equals(expected,try)

puts "3. { a: 2, b: 5, c: 1 } => [1, 2, 5]"
h = { a: 2, b: 5, c: 1 }
expected = [1, 2, 5]
try = h.values.sort
puts Test.assert_equals(expected,try)

puts "4. { a: 1, b: 2, c: 3 } => { '1'=>'a', '2'=>'b', '3'=>'c' }"
h = { a: 1, b: 2, c: 3 }
expected = { "1"=>"a", "2"=>"b", "3"=>"c" }
try = h.values.map(&:to_s).zip(h.keys.map(&:to_s)).to_h
puts Test.assert_equals(expected,try)
