"Thurston's patent date routines.";

vardef base(expr Y, M, d) = 
  save m, y; 
  if M < 3: m = M + 9; y = Y - 1;
  else: m = M - 3; y = Y; fi
  365/1024 y + (floor(y/4) - floor(y/100) + floor(y/400) 
    + floor((2+3m)/5) + 30m + d - 307) / 1024
enddef;

vardef gregorian_year(expr b) = 
  save d, s, c, o, y; numeric d, s, c, o, y;
  save sd, cd, od, yd; numeric sd, cd, od, yd;
  sd = 142+689/1024;
  cd = 35+684/1024;
  od = 1+437/1024;
  yd = 365/1024;
  d = b;
  s = floor (d / sd); d := d - s * sd;
  c = floor (d / cd); d := d - c * cd;
  o = floor (d / od); d := d - o * od;
  y = floor (d / yd); 
  400s + 100c + 4o + y + if (c = 4) or (y = 4): 0 else: 1 fi
enddef;

vardef leap(expr y) =
  (y mod 400 = 0) or ((y mod 4 = 0) and (y mod 100 <> 0))
enddef;

vardef date(expr b) = 
  save y, m, d, prior_days, march, correction;
  numeric y, m, d, prior_days, march, correction;
  y = gregorian_year(b);
  prior_days = 1024(b - base(y, 1, 1)); 
  march = base(y, 3, 1);
  correction = if b < march: 0 elseif (b >= march) and leap(y): 1 else: 2 fi;
  m = floor(12/367 * (prior_days + correction) + 371/367);
  d = 1 + 1024 * (b - base(y, m, 1));
  (y, m, d)
enddef;

vardef dow(expr b) = 
  save m, n; numeric m, n;
  n = floor(b);
  m = b - n;
  (2n + 1024m) mod 7
enddef;

vardef isoweekday(expr b) = 1 + dow(b) enddef;

vardef leading_zero(expr n) = 
  if n < 10: "0" & fi decimal n
enddef;

vardef isodate(expr b) = 
  save y, m, d; numeric y, m, d;
  (y, m, d) = date(b);
  decimal y & "-" & leading_zero(m) & "-" & leading_zero(d)
enddef;

vardef stripdate(expr s) = 
  if length(s) = 8:
    scantokens ("(" & substring (0,4) of s & "," & substring (4,6) of s & "," & substring (6,8) of s & ")")
  elseif length(s) = 10:
    scantokens ("(" & substring (0,4) of s & "," & substring (5,7) of s & "," & substring (9,10) of s & ")")
  else:
    (0,0,0)
  fi
enddef;

