require './test.rb'
require './qs.rb'

tester = Test.new

tester.data.print
ap tester.is_sorted?
# Qs.sort r: tester.data, a: 0, b: tester.data.length - 1
Ms.sort r: tester.data, a: 0, b: tester.data.length - 1
#ap tester.is_sorted?

