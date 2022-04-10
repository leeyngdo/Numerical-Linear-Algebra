function [] = smallest_representable_int()
  %% A floating point system F includes many integers, but not all of them.

  % Give an exact formula for the smallest positive integer n that does not belong to F .
  % Figure out a way to verify this result for your own computer. 
  % Specifically, design and run a program that produces evidence that n-3, n-2, and n-1 belong to F but n does not. What about n+1, n+2, and n+3.
  
  
  % Note that t = 53 for IEEE double precision
  t = 53; 
  % Claim: 2^(t) + 1 is the smallest positive integer n that does not belong to F.
  n = 2^t + (-4 : 4)
  % If two adjacent integers are both representable, the gap between them must be 1.
  diff(n)
end
