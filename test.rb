require 'awesome_print'

class Test
  attr_accessor :data

  def initialize _n = 12
    @data = Array.new
    @rand = Random.new 42

    _n.times do |i|
      @data.push @rand.rand(0..30)
    end

    @_data = @data.dup
  end

  def is_sorted?
    (@_data.length-1).times do |i|
      return false if @data[i] > @data[i + 1]
    end

    return true
  end
end

class Array
  def print
    puts self.map{ |x| sprintf("% 3d", x) }.join(' ')
  end
end