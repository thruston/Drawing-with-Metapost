\documentclass{standalone}
\usepackage{luamplib}
\begin{document}
\begin{mplibcode}
beginfig(1);

def U primary s = if string s: decode(s) fi enddef;

vardef decode(expr given) = 
  save a,b,i,s,out; string s, out; numeric a, b, i;
  out = ""; i=0;
  forever:
    i := i+1; s := substring(i-1,i) of given; a := ASCII s;
    if a < 128: 
    elseif a = 194: 
      i := i+1; s := substring (i-1,i) of given;
    elseif a = 195: 
      i := i+1; s := char (64 + ASCII substring (i-1,i) of given);
    else: 
      s := "?";
    fi
    out := out & s;
    exitif i >= length given;
  endfor
  out
enddef;
beginfig(2);
  draw "café noir £2.50" infont "pncr8r";
  draw U"café noir £2.50" infont "pncr8r" shifted 12 down;
  defaultfont := "pncr8r";
  label.rt("café noir £2.50", 24 down);
  label.rt(U"café noir £2.50", 36 down);
endfig;
\end{mplibcode}
\end{document}
