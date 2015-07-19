# class Neighbor
#   def initialize(x, y)
#     @x = x                          # => 3, 3, 4, 4
#     @y = y                          # => 3, 3, 3, 3
#   end                               # => :initialize
# end                                 # => :initialize
#
#
# # t = Cell.new(3,2)  # => #<Cell:0x007fed429f8198 @x=3, @y=2, @neighbors=[], @cs=1, @fs=0>
# # l = Cell.new(2,3)  # => #<Cell:0x007fed429fae98 @x=2, @y=3, @neighbors=[], @cs=1, @fs=0>
# c = Cell.new(3,3)  # => #<Cell:0x007faa0203a170 @x=3, @y=3, @neighbors=[], @cs=1, @fs=0>
# r = Cell.new(4,3)  # => #<Cell:0x007faa020394f0 @x=4, @y=3, @neighbors=[], @cs=1, @fs=0>
# # b = Cell.new(3,4)  # => #<Cell:0x007fed429f1f28 @x=3, @y=4, @neighbors=[], @cs=1, @fs=0>
#
# @cells = []               # => []
# @cells << c << r          # => [#<Cell:0x007faa0203a170 @x=3, @y=3, @neighbors=[], @cs=1, @fs=0>, #<Cell:0x007faa020394f0 @x=4, @y=3, @neighbors=[], @cs=1, @fs=0>]
# # @cells << t << l << c << r << b  # ~> NameError: undefined local variable or method `t' for main:Object
# cells_size = @cells.size  # => 2
#
# @cells.each do |cell|     # => [#<Cell:0x007faa0203a170 @x=3, @y=3, @neighbors=[], @cs=1, @fs=0>, #<Cell:0x007faa020394f0 @x=4, @y=3, @neighbors=[], @cs=1, @fs=0>]
#   cell.neighbors << 'n1'  # => ["n1"], ["n1"]
#   cell.neighbors << 'n2'  # => ["n1", "n2"], ["n1", "n2"]
#   # cell.neighbors << 'n3'  # => ["n1", "n2", "n3"], ["n1", "n2", "n3"], ["n1", "n2", "n3"], ["n1", "n2", "n3"], ["n1", "n2", "n3"]
#   # cell.neighbors << 'n4'  # => ["n1", "n2", "n3", "n4"], ["n1", "n2", "n3", "n4"], ["n1", "n2", "n3", "n4"], ["n1", "n2", "n3", "n4"], ["n1", "n2", "n3", "n4"]
# end                       # => [#<Cell:0x007faa0203a170 @x=3, @y=3, @neighbors=["n1", "n2"], @cs=1, @fs=0>, #<Cell:0x007faa020394f0 @x=4, @y=3, @neighbors=["n1", "n2"], @cs=1, @fs=0>]
# @cells.first              # => #<Cell:0x007faa0203a170 @x=3, @y=3, @neighbors=["n1", "n2"], @cs=1, @fs=0>
#
# @cells.each do |cell|                                              # => [#<Cell:0x007faa0203a170 @x=3, @y=3, @neighbors=["n1", "n2"], @cs=1, @fs=0>, #<Cell:0x007faa020394f0 @x=4, @y=3, @neighbors=["n1", "n2"], @cs=1, @fs=0>]
#   cell.neighbors.map! { |neighbor| Neighbor.new(cell.x, cell.y) }  # => [#<Neighbor:0x007faa020326a0 @x=3, @y=3>, #<Neighbor:0x007faa02032330 @x=3, @y=3>], [#<Neighbor:0x007faa02031cc8 @x=4, @y=3>, #<Neighbor:0x007faa02031980 @x=4, @y=3>]
# end                                                                # => [#<Cell:0x007faa0203a170 @x=3, @y=3, @neighbors=[#<Neighbor:0x007faa020326a0 @x=3, @y=3>, #<Neighbor:0x007faa02032330 @x=3, @y=3>], @cs=1, @fs=0>, #<Cell:0x007faa020394f0 @x=4, @y=3, @neighbors=[#<Neighbor:0x007faa02031cc8 @x=4, @y=3>, #<Neighbor:0x007faa02031980 @x=4, @y=3>], @cs=1, @fs=0>]
# p @cells.first.neighbors                                           # => [#<Neighbor:0x007faa020326a0 @x=3, @y=3>, #<Neighbor:0x007faa02032330 @x=3, @y=3>]
#
#
# r.neighbors  # => [#<Neighbor:0x007faa02031cc8 @x=4, @y=3>, #<Neighbor:0x007faa02031980 @x=4, @y=3>]
#
# # >> [#<Neighbor:0x007faa020326a0 @x=3, @y=3>, #<Neighbor:0x007faa02032330 @x=3, @y=3>]
