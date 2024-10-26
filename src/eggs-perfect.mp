\documentclass{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
input eggs-common
beginfig(1);
        
path egg; 
egg = for t=-180 step 15 until 180 - eps:
        (0.78 cosd(1/4 t) * sind(t), -cosd(t)) ..
    endfor cycle;
egg := egg scaled 128;

fill egg withpen pencircle scaled 2 withcolor eggshell;
picture P; P = currentpicture;
drawoptions(withpen pencircle scaled 1/4 withcolor 1/2);
draw egg; 
drawoptions(withpen pencircle scaled 2 withcolor 7/16);
draw origin;
for i=1 upto length egg: draw point i of egg; endfor
drawoptions();

draw P shifted 240 right;

endfig;
\end{mplibcode}
\end{document}

