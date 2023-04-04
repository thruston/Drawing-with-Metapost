% why have I set this one using `lualatex`?  
% (a) to keep my build process consistent, so that I am using luamplib for *all* 
% the external pictures
% (b) to show you that you can use the full traditional MP typesetting with "infont"
% even though you are compiling with lualatex...
% Toby Thurston -- 04 Apr 2023 
\documentclass{standalone}
\usepackage{luamplib}
\begin{document}
\begin{mplibcode}
beginfig(1);
ypos = 0;
picture matrix; 
for $="texnansi-lmr10", "pplr8r":
  draw ("Font: " & $) infont "texnansi-lmss10" scaled .7 shifted (-20,ypos) withcolor .67 red;
  for m=0 upto 15:
    ypos := ypos - 12;
    if (m mod 4)=0:
      ypos := ypos - 4;
    fi
    label.lft(decimal 16m infont "texnansi-lmss10" scaled .7, (-7,ypos+3)) withcolor .67 red;
    for c=0 upto 15:
      xx := 16m+c;
      if (xx<>0) and (xx<>10) and (xx<>13) and (xx<>160):
        matrix := char (16m+c) infont $;
        draw matrix shifted (c*14,ypos) shifted 1/2(llcorner matrix - lrcorner matrix) 
          withcolor if ((32<xx) and (xx<127)) or (160<xx): black else: .67 blue fi;
      else:
        draw unitsquare shifted 1/2 left scaled 3 shifted (c*14,ypos) withcolor .67 red;
      fi
    endfor
  endfor
  for i=0 upto 4: draw (-7+56i,ypos-4) -- (-7+56i,ypos+17*12-4) withcolor .67 red; endfor
  ypos := ypos - 24;
endfor
endfig;
\end{mplibcode}
\end{document}
