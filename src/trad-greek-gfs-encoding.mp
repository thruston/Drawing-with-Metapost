\documentclass[border=3mm]{standalone}
\usepackage{luamplib}
\begin{document}
\begin{mplibcode}
beginfig(1);
string ab, AB;
ab = "abgdezhjiklmnoxprstufqyw";
AB = "ABGDEZHJIKLMNOXPRSTUFQYW";
y := 0;
for $="grmn1000", "gporsonrg6r", "gneohellenicrg6r":
  draw ("draw ab infont " & ditto & $ & ditto) infont "texnansi-lmtt10" scaled 0.8 shifted (0,y) withcolor .67 red;
  draw ab infont $ shifted (0,y-10);
  draw AB infont $ shifted (0,y-22);
  y := y - 40;
endfor
undraw (6 left -- 180 right) shifted 12 up;
undraw (6 left -- 180 right) shifted 108 down;
endfig;
\end{mplibcode}
\end{document}

