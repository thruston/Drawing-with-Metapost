\documentclass{standalone}
\usepackage{luamplib}
\mplibtextextlabel{enable}
\usepackage{fontspec}
\setmainfont{TeX Gyre Heros}
\begin{document}
\begin{mplibcode}
input london-boroughs
input colorbrewer-rgb
picture legend; legend = image(
for i = 1 upto 9:
  path s; s = unitsquare scaled 12 shifted (12i, 0);
  fill s withcolor RdYlBu[9][i]; draw s;
  if i = 1:
    label.top("Leave", point 5/2 of s);
  elseif i = 9:
    label.top("Remain", point 5/2 of s);
  fi
endfor
);
vardef median(expr p) = 
    save n; numeric n; n = length p; 
    1/n * point 0 of p for i=1 upto n: + 1/n * point i of p endfor
enddef;

beginfig(1);

fill Barking_and_Dagenham    withcolor 0.756 [RdYlBu 9 3, RdYlBu 9 4]; draw Barking_and_Dagenham;
fill Barnet                  withcolor 0.223 [RdYlBu 9 6, RdYlBu 9 7]; draw Barnet;
fill Bexley                  withcolor 0.705 [RdYlBu 9 3, RdYlBu 9 4]; draw Bexley;
fill Brent                   withcolor 0.974 [RdYlBu 9 5, RdYlBu 9 6]; draw Brent;
fill Bromley                 withcolor 0.065 [RdYlBu 9 5, RdYlBu 9 6]; draw Bromley;
fill Camden                  withcolor 0.494 [RdYlBu 9 7, RdYlBu 9 8]; draw Camden;
fill City_of_London          withcolor 0.529 [RdYlBu 9 7, RdYlBu 9 8]; draw City_of_London;
fill Croydon                 withcolor 0.429 [RdYlBu 9 5, RdYlBu 9 6]; draw Croydon;
fill Ealing                  withcolor 0.040 [RdYlBu 9 6, RdYlBu 9 7]; draw Ealing;
fill Enfield                 withcolor 0.582 [RdYlBu 9 5, RdYlBu 9 6]; draw Enfield;
fill Greenwich               withcolor 0.559 [RdYlBu 9 5, RdYlBu 9 6]; draw Greenwich;
fill Hackney                 withcolor 0.848 [RdYlBu 9 7, RdYlBu 9 8]; draw Hackney;
fill Hammersmith_and_Fulham  withcolor 0.002 [RdYlBu 9 7, RdYlBu 9 8]; draw Hammersmith_and_Fulham;
fill Haringey                withcolor 0.557 [RdYlBu 9 7, RdYlBu 9 8]; draw Haringey;
fill Harrow                  withcolor 0.463 [RdYlBu 9 5, RdYlBu 9 6]; draw Harrow;
fill Havering                withcolor 0.034 [RdYlBu 9 3, RdYlBu 9 4]; draw Havering;
fill Hillingdon              withcolor 0.363 [RdYlBu 9 4, RdYlBu 9 5]; draw Hillingdon;
fill Hounslow                withcolor 0.106 [RdYlBu 9 5, RdYlBu 9 6]; draw Hounslow;
fill Islington               withcolor 0.522 [RdYlBu 9 7, RdYlBu 9 8]; draw Islington;
fill Kensington_and_Chelsea  withcolor 0.869 [RdYlBu 9 6, RdYlBu 9 7]; draw Kensington_and_Chelsea;
fill Kingston_upon_Thames    withcolor 0.161 [RdYlBu 9 6, RdYlBu 9 7]; draw Kingston_upon_Thames;
fill Lambeth                 withcolor 0.862 [RdYlBu 9 7, RdYlBu 9 8]; draw Lambeth;
fill Lewisham                withcolor 0.986 [RdYlBu 9 6, RdYlBu 9 7]; draw Lewisham;
fill Merton                  withcolor 0.294 [RdYlBu 9 6, RdYlBu 9 7]; draw Merton;
fill Newham                  withcolor 0.284 [RdYlBu 9 5, RdYlBu 9 6]; draw Newham;
fill Redbridge               withcolor 0.397 [RdYlBu 9 5, RdYlBu 9 6]; draw Redbridge;
fill Richmond_upon_Thames    withcolor 0.929 [RdYlBu 9 6, RdYlBu 9 7]; draw Richmond_upon_Thames;
fill Southwark               withcolor 0.281 [RdYlBu 9 7, RdYlBu 9 8]; draw Southwark;
fill Sutton                  withcolor 0.628 [RdYlBu 9 4, RdYlBu 9 5]; draw Sutton;
fill Tower_Hamlets           withcolor 0.746 [RdYlBu 9 6, RdYlBu 9 7]; draw Tower_Hamlets;
fill Waltham_Forest          withcolor 0.910 [RdYlBu 9 5, RdYlBu 9 6]; draw Waltham_Forest;
fill Wandsworth              withcolor 0.503 [RdYlBu 9 7, RdYlBu 9 8]; draw Wandsworth;
fill Westminster             withcolor 0.897 [RdYlBu 9 6, RdYlBu 9 7]; draw Westminster;

% scaling represents turnout
label(TEX("Barking \& Dagenham")   scaled 0.637 rotated 15,   median(Barking_and_Dagenham));
label(TEX("Barnet")                scaled 0.720,             median(Barnet) shifted 12 up);
label(TEX("Bexley")                scaled 0.752,             median(Bexley) shifted 12 left);
label(TEX("Brent")                 scaled 0.649,             median(Brent) shifted 12 left);
label(TEX("Bromley")               scaled 0.788,             median(Bromley));
label(TEX("Camden")                scaled 0.654,             median(Camden) shifted 6 left);
label(TEX("City")                  scaled 0.734,             median(City_of_London));
label(TEX("Croydon")               scaled 0.697,             median(Croydon));
label(TEX("Ealing")                scaled 0.699,             median(Ealing));
label(TEX("Enfield")               scaled 0.690,             median(Enfield));
label(TEX("Greenwich")             scaled 0.694,             median(Greenwich) shifted 6 right);
label(TEX("Hackney")               scaled 0.650,             median(Hackney) shifted 8 right);
label(TEX("Hammersmith \& Fulham") scaled 0.698 rotated -62,  median(Hammersmith_and_Fulham));
label(TEX("Haringey")              scaled 0.705,             median(Haringey));
label(TEX("Harrow")                scaled 0.721,             median(Harrow));
label(TEX("Havering")              scaled 0.759,             median(Havering));
label(TEX("Hillingdon")            scaled 0.689,             median(Hillingdon) shifted 6 right);
label(TEX("Hounslow")              scaled 0.697,             median(Hounslow) shifted 12 left);
label(TEX("Islington")             scaled 0.703,             median(Islington) shifted 4 right);
label(TEX("Kensington \& Chelsea") scaled 0.659 rotated -54,  median(Kensington_and_Chelsea));
label(TEX("Kingston upon Thames")  scaled 0.783 rotated 66,   median(Kingston_upon_Thames));
label(TEX("Lambeth")               scaled 0.673,             median(Lambeth) shifted 4 left);
label(TEX("Lewisham")              scaled 0.630,             median(Lewisham) shifted 8 right);
label(TEX("Merton")                scaled 0.734,             median(Merton));
label(TEX("Newham")                scaled 0.591,             median(Newham));
label(TEX("Redbridge")             scaled 0.675,             median(Redbridge));
label.lft(TEX("Richmond")          scaled 0.820,             median(Richmond_upon_Thames) shifted (-1,4));
label.rt(TEX("upon Thames")        scaled 0.820,             median(Richmond_upon_Thames) shifted (-9,-6));
label(TEX("Southwark")             scaled 0.661,             median(Southwark) shifted 4 left);
label(TEX("Sutton")                scaled 0.759,             median(Sutton));
label(TEX("Tower Hamlets")         scaled 0.644,             median(Tower_Hamlets) shifted 8 left);
label(TEX("Waltham Forest")        scaled 0.666 rotated 50,             median(Waltham_Forest));
label(TEX("Wandsworth")            scaled 0.719,             median(Wandsworth) shifted 8 left);
label(TEX("Westminster")           scaled 0.648,             median(Westminster));

label.ulft(legend, point 1 of bbox currentpicture);
label.lrt("\large Brexit vote in London 2016", point 3 of bbox currentpicture shifted (4,-4));
 

endfig;
\end{mplibcode}
\end{document}
