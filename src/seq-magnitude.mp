\documentclass[border=5mm]{standalone}
\usepackage{unicode-math}
% \setmainfont{TeX Gyre Pagella}
% \setmathfont{TeX Gyre Pagella Math}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
beginfig(1);
numeric u, v;
v = 10;
for e = -10 upto 10:
    label("$" & if e=0: "1=" & fi "10^{\smash{" & decimal 3e & "}}$", (0, 3e * v));
endfor
picture gauge; gauge = image(
    for e=-30 upto 31:
        draw (left--right) if e mod 3 = 0: scaled 6 fi shifted (0, e * v) 
            withpen pencircle scaled if e=0: 1/2 else: 1/4 fi;
    endfor
    draw (0, -30v) -- (0, 32v) withpen pencircle scaled 1/4;
);

draw gauge shifted 30 right;
draw gauge shifted 170 right;
draw gauge shifted 270 right;
draw gauge shifted 430 right;

numeric x; x = 100;  
label("\strut\textbf{Distances} — m", (x, 34v));
label("diameter of nucleus",          (x,-14.69897v));
label("diameter of molecule",         (x,-9.52288v));
label("wavelength of visible light",  (x,-6.2596v));
label("thickness of Al foil",         (x,-4.79588v));
label("height of adult human",        (x, 0.25527v));
label("radius of Moon",               (x, 6.2399v));
label("radius of Solar system",       (x, 12.6575v));
label("distance to nearest star",     (x, 16.6039v));
label("radius of Milky Way",          (x, 20.6989v));
label("farthest star seen by HST",    (x, 26.0865v));

x := 220;
label("\strut\textbf{Mass of objects} — kg", (x, 34v));
label("Sun", (x, 30.2986v));
label("Earth", (x, 24.7761v));
label("large ship", (x, 8.69897v));
label("car", (x, 3.1761v));
label("cricket ball", (x, -0.79588v));
label("atomized oil drop", (x, -4.79588v));  % 16e-6 kg
label("red blood cell", (x, -13.5686v));  % 27 picogram  (10^(-15) kg)
label("protein molecule", (x, -24.08v));  % 500 Da    
label("proton", (x, -26.77975v));  % 1 Da     
label("electron", (x, -30.0405v));  % log(9.109*10**-31) 

x := 350; 
label("\strut\textbf{Time intervals} — s", (x, 34v));
label("age of Universe", (x, 17.639v)); % log(13.8*10**9*365.2425*24*3600,10) \simeq 17.639 
%label("age of Earth", (x, 17.1563v)); % log(4.542*10**9*365.2425*24*3600,10) \simeq 17.1563 
% label("Cambrian explosion", (x, 16.2305v));          % log(538.8*10**6*365.2425*24*3600) \simeq 16.2305 
label("first humans", (x, 13.8v));          % log(2*10**6*365.2425*24*3600) \simeq 13.8001  
label("human life expectancy", (x, 9.40219v)); % log(80*365.2425*24*3600) \simeq 9.40219 
label("year", (x, 7.4991v)); % log(365.2425*24*3600) \simeq 7.4991
label("day", (x, 4.93651v)); % log(24*3600) \simeq 4.93651 
label("time between heart beats", (x, 0.07918v)); % log(72/60) \simeq 0.0791812 
label("period of highest audible note", (x, -4.23v)); % log(1/17000) \simeq -4.23045 
label("duration of photon emission", (x, -8.796v)); % log(1.6*10**-9) \simeq -8.79588  
label("period of visible light", (x, -14.7324v)); % log(1/(540*10**12)) \simeq -14.7324 
label("time for light to cross an electron", (x, -23.0272v)); % log(2.81794*10**-15/(3*10**8)) \simeq -23.0272


% input ruler-cm

endfig;
\end{mplibcode}
\end{document}

