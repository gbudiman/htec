require './test.rb'
require './qs.rb'
require './ms.rb'

tester = Test.new 171

#tester.data.print
ap tester.is_sorted?
# Qs.sort r: tester.data, a: 0, b: tester.data.length - 1
Ms.sort r: tester.data
ap tester.is_sorted?

