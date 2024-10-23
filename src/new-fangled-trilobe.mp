\documentclass[border=5mm]{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
def withalpha expr a = 
  withprescript "tr_alternative=2"
  withprescript "tr_transparency=" & decimal a
enddef;
beginfig(1);
  numeric u; u = 24; color shade[]; string name[];
  shade0 = 1/256(166, 57, 65);   name0 = "R"; % rouge 
  shade1 = 1/256(219, 170, 72);  name1 = "J"; % jaune
  shade2 = 1/256(36, 54, 84);    name2 = "B"; % bleu
  path edge[], arc[], ring[];
  for r=1 upto 8:
    edge[r] = fullcircle rotated 90 scaled (2r * u) 
    shifted (0, 7u / sqrt 3) rotated 120;
  endfor
  for i=2 upto 8:
    edge[i] := edge[i] cutbefore edge8 rotated 120 
                       cutafter edge8 rotated -120;
  endfor
  arc0 = point 0 of edge1 for i=2 upto 7: .. point 0 of edge[i] endfor;
  arc1 = point 0 of edge1 for i=2 upto 7: .. point infinity of edge[i] endfor;
  for i=1 upto 7:
    ring[i] = edge[i] -- subpath (i-1, i) of arc1 -- 
    reverse edge[i+1] -- subpath (i, i-1) of arc0 -- cycle;
  endfor
  for r=0, 1, 2: for i=1 upto 6:  % fills first
      fill ring[i] rotated 120r withcolor (i/6)[white, shade[r]] withalpha 0.9;
      for k=0, 1:
        label("$\textsf{" & name[r] & "}" if i<6: & "_" & decimal i fi & "$",
          point i-1/2 of arc[k] shifted (-8,-2) rotated 120r);
       endfor
  endfor endfor
  for r=0, 1, 2: % now lines on top
    for i=1 upto 7:
      draw edge[i] rotated 120r withpen pencircle scaled 1 withcolor 7/8;
    endfor
    draw arc0 rotated 120r; draw arc1 rotated 120r;
  endfor
endfig;
\end{mplibcode}
\end{document}

