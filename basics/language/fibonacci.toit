/**
This example defines a top-level function called fib that is not a member of any class.
It prints the 10th number in the fibonacci sequence. 

The fib function is recursive, calling itself, and also makes use of a few new features. 
The if-statement is well known from other languages. In Toit it works by taking an expression 
and conditionally evaluating a block. Like other blocks we could have used indentation to group 
multiple lines.
*/

fib n:
  if n <= 1: return n
  return (fib n-1) + (fib n-2)

main:
  print "The 10th Fibonacci number is $(fib 10)"
