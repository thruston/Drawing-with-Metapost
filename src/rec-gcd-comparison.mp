vardef gcd(expr a, b) = if b = 0: a else: gcd(b, a mod b) fi enddef;

show
  (gcd(560,257) = 1) and
  (gcd(12,3384) = 12) and
  (gcd(2454,541) = 1) and
  (gcd(2824,494) = 2) and
  (gcd(3633,2930) = 1) and
  (gcd(3555,3738) = 3) and
  (gcd(2743,3484) = 13) and
  (gcd(1267,1330) = 7) and
  (gcd(2718,1672) = 2) and
  (gcd(2515,3980) = 5); 

vardef gcd(expr A, B) = save r, a, b; numeric a, b, r; a := A; b := B;
  forever:
    r := a mod b; exitif r = 0;
    a := b; b := r;
  endfor b
enddef;

show
  (gcd(560,257) = 1) and
  (gcd(12,3384) = 12) and
  (gcd(2454,541) = 1) and
  (gcd(2824,494) = 2) and
  (gcd(3633,2930) = 1) and
  (gcd(3555,3738) = 3) and
  (gcd(2743,3484) = 13) and
  (gcd(1267,1330) = 7) and
  (gcd(2718,1672) = 2) and
  (gcd(2515,3980) = 5); 

end.
