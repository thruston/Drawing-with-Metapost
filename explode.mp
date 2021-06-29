\documentclass[border=5mm]{standalone}
\usepackage{luamplib}
\usepackage{fontspec}
\setmainfont{PlayfairDisplay-Black}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
input colorbrewer-rgb
randomseed:=2128.5073;
beginfig(1);
n = 40; r = 7 ; s = 44;
path explosion, splash;
explosion = for i=1 upto n:
  (s if odd(i): - else: + fi r + uniformdeviate r,0) rotated (i*360/n) --
endfor cycle; 

splash = for i=1 upto n:
  (s if odd(i): - else: + fi r + uniformdeviate r,0) rotated (i*360/n) ..
endfor cycle; 
splash := splash shifted (3s,0);

fill explosion withcolor Oranges 7 4;
draw explosion withpen pencircle scaled 2 withcolor Reds 7 7;
label(TEX("\textbf{BOOM!}") scaled 1.6, center explosion) withcolor Reds 7 7;

fill splash withcolor Blues 7 2;
draw splash withpen pencircle scaled 2 withcolor Blues 7 7;
label(TEX("\bfseries SPLAT!") scaled 1.6, center splash) withcolor Blues 7 7;
endfig;
\end{mplibcode}
\end{document}
