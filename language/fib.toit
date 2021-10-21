/**
Fibonacci example in Toit.

This example shows two versions of a Fibonacci sequence generator: 
a recursive (fib) and an iterative (iterative_fib).

The main function prints the results of fib(17) and iterative_fib(17), 
as well as how long it took to execute the two methods.

*/

main:
  x := 17
  start := Time.monotonic_us
  print "fib($x) = $(fib x)"
  print "iterative_fib($x) = $(iterative_fib x)"
  print "Time spent on both runs: $(%.2f (Time.monotonic_us - start)/1000.0) ms"

fib n:
  if n <= 2: return 1
  return (fib n - 1) + (fib n - 2)

iterative_fib n:
  if n <= 2: return 1

  n1 := 1
  n2 := 1
  i := 3

  while i < n:
    tmp := n2
    n2 = n2 + n1
    n1 = tmp
    i = i + 1

  return n1 + n2
