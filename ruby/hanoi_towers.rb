 # The classic hanoi towers challenge.
 #   Given three posts and a stack of discs with holes and different diameters.
 #   Change the stack from one post to another without stacking a disc with a bigger
 #   diameter on top of a disc with a smaller diameter.

 #   This problem is solved recursively

 def hanoi_tower(n, src, aux, dest)
  if n > 0
    hanoi_tower(n-1, src, dest, aux)
    puts "Move disc #{n} from #{src} to #{dest}"
    hanoi_tower(n-1, aux, src, dest)
  end
 end

hanoi_tower(5, "First post", "Destination post", "Auxiliary post")
