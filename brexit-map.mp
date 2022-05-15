\documentclass{standalone}
\usepackage{luamplib}
\begin{document}
\begin{mplibcode}
input london-boroughs
input colorbrewer-rgb
beginfig(1);

fill Barking_and_Dagenham    withcolor  0.637930438987[white,  RdYlBu  9  3];  draw  Barking_and_Dagenham;
fill Barnet                  withcolor  0.720611991927[white,  RdYlBu  9  6];  draw  Barnet;
fill Bexley                  withcolor  0.752370022075[white,  RdYlBu  9  3];  draw  Bexley;
fill Brent                   withcolor  0.649938702200[white,  RdYlBu  9  5];  draw  Brent;
fill Bromley                 withcolor  0.788135117271[white,  RdYlBu  9  5];  draw  Bromley;
fill Camden                  withcolor  0.654172253739[white,  RdYlBu  9  7];  draw  Camden;
fill City_of_London          withcolor  0.734758643728[white,  RdYlBu  9  7];  draw  City_of_London;
fill Croydon                 withcolor  0.697512522977[white,  RdYlBu  9  5];  draw  Croydon;
fill Ealing                  withcolor  0.699752571705[white,  RdYlBu  9  5];  draw  Ealing;
fill Enfield                 withcolor  0.690095621185[white,  RdYlBu  9  5];  draw  Enfield;
fill Greenwich               withcolor  0.694603088177[white,  RdYlBu  9  5];  draw  Greenwich;
fill Hackney                 withcolor  0.650804732858[white,  RdYlBu  9  7];  draw  Hackney;
fill Hammersmith_and_Fulham  withcolor  0.698588753559[white,  RdYlBu  9  6];  draw  Hammersmith_and_Fulham;
fill Haringey                withcolor  0.705179282869[white,  RdYlBu  9  7];  draw  Haringey;
fill Harrow                  withcolor  0.721842152257[white,  RdYlBu  9  5];  draw  Harrow;
fill Havering                withcolor  0.759692378279[white,  RdYlBu  9  3];  draw  Havering;
fill Hillingdon              withcolor  0.689115332612[white,  RdYlBu  9  4];  draw  Hillingdon;
fill Hounslow                withcolor  0.697219024538[white,  RdYlBu  9  5];  draw  Hounslow;
fill Islington               withcolor  0.703046071661[white,  RdYlBu  9  7];  draw  Islington;
fill Kensington_and_Chelsea  withcolor  0.659172466944[white,  RdYlBu  9  6];  draw  Kensington_and_Chelsea;
fill Kingston_upon_Thames    withcolor  0.783457983425[white,  RdYlBu  9  6];  draw  Kingston_upon_Thames;
fill Lambeth                 withcolor  0.673263757116[white,  RdYlBu  9  7];  draw  Lambeth;
fill Lewisham                withcolor  0.630198365685[white,  RdYlBu  9  6];  draw  Lewisham;
fill Merton                  withcolor  0.734129312368[white,  RdYlBu  9  6];  draw  Merton;
fill Newham                  withcolor  0.591569907054[white,  RdYlBu  9  5];  draw  Newham;
fill Redbridge               withcolor  0.675468676749[white,  RdYlBu  9  5];  draw  Redbridge;
fill Richmond_upon_Thames    withcolor  0.820360094095[white,  RdYlBu  9  6];  draw  Richmond_upon_Thames;
fill Southwark               withcolor  0.661146139119[white,  RdYlBu  9  7];  draw  Southwark;
fill Sutton                  withcolor  0.759580291971[white,  RdYlBu  9  4];  draw  Sutton;
fill Tower_Hamlets           withcolor  0.644946966988[white,  RdYlBu  9  6];  draw  Tower_Hamlets;
fill Waltham_Forest          withcolor  0.666026518103[white,  RdYlBu  9  5];  draw  Waltham_Forest;
fill Wandsworth              withcolor  0.719220484601[white,  RdYlBu  9  7];  draw  Wandsworth;
fill Westminster             withcolor  0.648800238957[white,  RdYlBu  9  6];  draw  Westminster;

picture legend; legend = image(
numeric s; s = 10;
for i = 1 upto 9:
   fill unitsquare scaled s shifted (i*s, 0) withcolor RdYlBu[9][i];
   if i > 1: draw (i*s, 0) -- (i*s, s); fi
endfor
draw unitsquare xscaled 9s yscaled s shifted (s,0);
label.top("Remain" infont "phvr8r", (10s, s));
label.top("Leave" infont "phvr8r", (s, s)););
label.ulft(legend, point 1 of bbox currentpicture);
label.lrt("Brexit vote in London 2016" infont "phvr8r", point 3 of bbox currentpicture);
   

endfig;
\end{mplibcode}
\end{document}
