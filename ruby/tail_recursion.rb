
def add(n)
  return 0 if n == 0
  n + add(n-1)
end

def add_tail(n, running = 0)
  return running if n == 0
  add_tail(n-1, running+n)
end

p add(1286)
p add_tail(1286)
