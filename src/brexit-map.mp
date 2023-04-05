\documentclass{standalone}
\usepackage{luamplib}
\mplibtextextlabel{enable}
\begin{document}
\begin{mplibcode}
input london-boroughs
input colorbrewer-rgb
vardef median(expr p) = 
    save n; numeric n; n = length p; 
    1/n * point 0 of p for i=1 upto n: + 1/n * point i of p endfor
enddef;

beginfig(1);

fill Barking_and_Dagenham    withcolor 0.638 [white, RdYlBu 9 3]; draw Barking_and_Dagenham; 
fill Barnet                  withcolor 0.721 [white, RdYlBu 9 6]; draw Barnet;
fill Bexley                  withcolor 0.752 [white, RdYlBu 9 3]; draw Bexley;
fill Brent                   withcolor 0.650 [white, RdYlBu 9 5]; draw Brent;
fill Bromley                 withcolor 0.788 [white, RdYlBu 9 5]; draw Bromley;
fill Camden                  withcolor 0.654 [white, RdYlBu 9 7]; draw Camden;
fill City_of_London          withcolor 0.735 [white, RdYlBu 9 7]; draw City_of_London;
fill Croydon                 withcolor 0.698 [white, RdYlBu 9 5]; draw Croydon;
fill Ealing                  withcolor 0.700 [white, RdYlBu 9 5]; draw Ealing;
fill Enfield                 withcolor 0.690 [white, RdYlBu 9 5]; draw Enfield;
fill Greenwich               withcolor 0.695 [white, RdYlBu 9 5]; draw Greenwich;
fill Hackney                 withcolor 0.651 [white, RdYlBu 9 7]; draw Hackney;
fill Hammersmith_and_Fulham  withcolor 0.699 [white, RdYlBu 9 6]; draw Hammersmith_and_Fulham;
fill Haringey                withcolor 0.705 [white, RdYlBu 9 7]; draw Haringey;
fill Harrow                  withcolor 0.722 [white, RdYlBu 9 5]; draw Harrow;
fill Havering                withcolor 0.760 [white, RdYlBu 9 3]; draw Havering;
fill Hillingdon              withcolor 0.689 [white, RdYlBu 9 4]; draw Hillingdon;
fill Hounslow                withcolor 0.697 [white, RdYlBu 9 5]; draw Hounslow;
fill Islington               withcolor 0.703 [white, RdYlBu 9 7]; draw Islington;
fill Kensington_and_Chelsea  withcolor 0.659 [white, RdYlBu 9 6]; draw Kensington_and_Chelsea;
fill Kingston_upon_Thames    withcolor 0.783 [white, RdYlBu 9 6]; draw Kingston_upon_Thames;
fill Lambeth                 withcolor 0.673 [white, RdYlBu 9 7]; draw Lambeth;
fill Lewisham                withcolor 0.630 [white, RdYlBu 9 6]; draw Lewisham;
fill Merton                  withcolor 0.734 [white, RdYlBu 9 6]; draw Merton;
fill Newham                  withcolor 0.592 [white, RdYlBu 9 5]; draw Newham;
fill Redbridge               withcolor 0.675 [white, RdYlBu 9 5]; draw Redbridge;
fill Richmond_upon_Thames    withcolor 0.820 [white, RdYlBu 9 6]; draw Richmond_upon_Thames;
fill Southwark               withcolor 0.661 [white, RdYlBu 9 7]; draw Southwark;
fill Sutton                  withcolor 0.760 [white, RdYlBu 9 4]; draw Sutton;
fill Tower_Hamlets           withcolor 0.645 [white, RdYlBu 9 6]; draw Tower_Hamlets;
fill Waltham_Forest          withcolor 0.666 [white, RdYlBu 9 5]; draw Waltham_Forest;
fill Wandsworth              withcolor 0.719 [white, RdYlBu 9 7]; draw Wandsworth;
fill Westminster             withcolor 0.649 [white, RdYlBu 9 6]; draw Westminster;

label("\tiny Barking \& Dagenham", median(Barking_and_Dagenham));
label("\tiny Barnet", median(Barnet));
label("\tiny Bexley", median(Bexley));
label("\tiny Brent", median(Brent));
label("\tiny Bromley", median(Bromley));
label("\tiny Camden", median(Camden));
label("\tiny City of London", median(City_of_London));
label("\tiny Croydon", median(Croydon));
label("\tiny Ealing", median(Ealing));
label("\tiny Enfield", median(Enfield));
label("\tiny Greenwich", median(Greenwich));
label("\tiny Hackney", median(Hackney));
label(TEX("\tiny Hammersmith \& Fulham") rotated -62, median(Hammersmith_and_Fulham));
label("\tiny Haringey", median(Haringey));
label("\tiny Harrow", median(Harrow));
label("\tiny Havering", median(Havering));
label("\tiny Hillingdon", median(Hillingdon));
label("\tiny Hounslow", median(Hounslow) shifted 12 left);
label("\tiny Islington", median(Islington));
label(TEX("\tiny Kensington \& Chelsea") rotated -54, median(Kensington_and_Chelsea));
label(TEX("\tiny Kingston upon Thames") rotated 66, median(Kingston_upon_Thames));
label("\tiny Lambeth", median(Lambeth));
label("\tiny Lewisham", median(Lewisham));
label("\tiny Merton", median(Merton));
label("\tiny Newham", median(Newham));
label("\tiny Redbridge", median(Redbridge));
label("\tiny Richmond upon Thames", median(Richmond_upon_Thames));
label("\tiny Southwark", median(Southwark));
label("\tiny Sutton", median(Sutton));
label("\tiny Tower Hamlets", median(Tower_Hamlets));
label("\tiny Waltham Forest", median(Waltham_Forest));
label("\tiny Wandsworth", median(Wandsworth));
label("\tiny Westminster", median(Westminster));

label("\tiny Barking \& Dagenham", median(Barking_and_Dagenham));
picture legend; legend = image(
numeric s; s = 10;
for i = 1 upto 9:
 fill unitsquare scaled s shifted (i*s, 0) withcolor RdYlBu  [9][i];
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
