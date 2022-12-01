\documentclass{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
beginfig(1);

path egg; 
egg = for t=-180 step 15 until 180 - eps:
        (0.78 cosd(1/4 t) * sind(t), -cosd(t)) ..
    endfor cycle;
egg := egg scaled 128;

fill egg withpen pencircle scaled 2 withcolor 3/4[1/4[red, green], white];
picture P; P = currentpicture;
drawoptions(withpen pencircle scaled 1/4 withcolor 1/2);
draw egg; draw origin withpen pencircle scaled 2;
for t=1 upto length egg: draw point t of egg withpen pencircle scaled 2; endfor
drawoptions();

draw P shifted 240 right;

endfig;
\end{mplibcode}
\end{document}

