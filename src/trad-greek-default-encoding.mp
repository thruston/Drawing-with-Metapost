\documentclass[border=3mm]{standalone}
\usepackage{luamplib}
\begin{document}
\begin{mplibcode}
beginfig(1);
  string ab, AB;
  ab = ("" for i=11 upto 23: & char i endfor 
     & "o" for i=24 upto 33: & char i endfor);
  AB = ("AB" & char 0 & char 1 & "EZH" & char 2 & "IK" 
        & char 3 & "MNO" & char 4 & char 5 & "P"
        & char 6 & "T"   & char 7 & char 8 & "X"
        & char 9 & char 10);

  draw ab infont "cmmi10";
  draw AB infont "cmmi10" shifted 12 down;
  draw ab infont "eurm10" shifted 32 down;
  draw AB infont "eurm10" shifted 44 down;
endfig;
\end{mplibcode}
\end{document}
