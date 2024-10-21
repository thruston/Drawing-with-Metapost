

vardef normaldeviate =
  save u, v, xa;
  forever:
    u := 1 - uniformdeviate 63/64;
    v := sqrt(8/mexp(256)) * (-1/2 + uniformdeviate 1);
    xa := v / u;
    exitif (xa * xa <= -mlog(u)/64);
  endfor
  xa
enddef;

vardef exponentialdeviate expr mu =
  save u;
  u = 1 - uniformdeviate 1;  % hence 0 < u <= 1 and so you avoid
  -mu * 1/256 mlog(u)        % the danger of calling mlog(0)
enddef;

vardef tand(expr theta) = 
  save x, y; 
  (x, y) = dir theta;
  if abs(x) < eps: infinity else: y/x fi
enddef;  
vardef exp(expr x) = mexp(256x) enddef;
vardef log(expr x) = 1/256 mlog(x) enddef;

% this is defined only for a > 1
vardef gammadeviate(expr a, b) =
  save y, x, v, s, accept; boolean accept;
  s = sqrt(2a - 1);
  forever:
    forever:
      y := tand(uniformdeviate 180);
      exitif abs(y) < 16;
    endfor
    x := s * y + a - 1;
    accept := false;
    if x > 0:
      v := uniformdeviate 1;
      if v <= (1 + y * y) * exp((a - 1) * log(x / (a - 1)) - s * y):
        accept := true;
      fi   
    fi   
    exitif accept;
  endfor
  x/b
enddef;
