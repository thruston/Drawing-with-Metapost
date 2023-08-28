\documentclass[border=5mm]{standalone}
\usepackage{luamplib}
\usepackage{fontspec}
\setmainfont{TeX Gyre Heros}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
string region[]; path prognosis[]; numeric n; n = 0; pair adj[];
region[incr n] = "Prostate";              prognosis[n] = (0, 98.8)--(1, 95.2)--(2, 87.1)--(3, 81.1); adj[n] = (0, 0);
region[incr n] = "Thyroid";               prognosis[n] = (0, 96.0)--(1, 95.8)--(2, 94.0)--(3, 95.4); adj[n] = (0, 0);
region[incr n] = "Testis";                prognosis[n] = (0, 94.7)--(1, 94.0)--(2, 91.1)--(3, 88.2); adj[n] = (0, 0);
region[incr n] = "Melanomas";             prognosis[n] = (0, 89.0)--(1, 86.7)--(2, 83.5)--(3, 82.8); adj[n] = (0, 0);
region[incr n] = "Breast";                prognosis[n] = (0, 86.4)--(1, 78.3)--(2, 71.3)--(3, 65.0); adj[n] = (0, 0);
region[incr n] = "Hodgkin's disease";     prognosis[n] = (0, 85.1)--(1, 79.8)--(2, 73.8)--(3, 67.1); adj[n] = (0, 0);
region[incr n] = "Corpus uteri, uterus";  prognosis[n] = (0, 84.3)--(1, 83.2)--(2, 80.8)--(3, 79.2); adj[n] = (0, 0);
region[incr n] = "Urinary, bladder";      prognosis[n] = (0, 82.1)--(1, 76.2)--(2, 70.3)--(3, 67.9); adj[n] = (0, 0);
region[incr n] = "Cervix, uteri";         prognosis[n] = (0, 70.5)--(1, 64.1)--(2, 62.8)--(3, 60.0); adj[n] = (0, 0);
region[incr n] = "Larynx";                prognosis[n] = (0, 68.8)--(1, 56.7)--(2, 45.8)--(3, 37.8); adj[n] = (0, 0);
region[incr n] = "Rectum";                prognosis[n] = (0, 62.6)--(1, 55.2)--(2, 51.8)--(3, 49.2); adj[n] = (0, 0);
region[incr n] = "Kidney, renal pelvis";  prognosis[n] = (0, 61.8)--(1, 54.4)--(2, 49.8)--(3, 47.3); adj[n] = (-12, 0);
region[incr n] = "Colon";                 prognosis[n] = (0, 61.7)--(1, 55.4)--(2, 53.9)--(3, 52.3); adj[n] = (0, 0);
region[incr n] = "Non-Hodgkin's";         prognosis[n] = (0, 57.8)--(1, 46.3)--(2, 38.3)--(3, 34.3); adj[n] = (0, 0);
region[incr n] = "Oral cavity, pharynx";  prognosis[n] = (0, 56.7)--(1, 44.2)--(2, 37.5)--(3, 33.0); adj[n] = (0, 0);
region[incr n] = "Ovary";                 prognosis[n] = (0, 55.0)--(1, 49.3)--(2, 49.9)--(3, 49.6); adj[n] = (0, 0);
region[incr n] = "Leukemia";              prognosis[n] = (0, 42.5)--(1, 32.4)--(2, 29.7)--(3, 26.2); adj[n] = (0, 6);
region[incr n] = "Brain, nervous system"; prognosis[n] = (0, 32.0)--(1, 29.2)--(2, 27.6)--(3, 26.1); adj[n] = (0, -6);
region[incr n] = "Multiple myeloma";      prognosis[n] = (0, 29.5)--(1, 12.7)--(2,  7.0)--(3,  4.8); adj[n] = (0, -6);
region[incr n] = "Stomach";               prognosis[n] = (0, 23.8)--(1, 19.4)--(2, 19.0)--(3, 14.9); adj[n] = (0, 0);
region[incr n] = "Lung and bronchus";     prognosis[n] = (0, 15.0)--(1, 10.6)--(2,  8.1)--(3,  6.5); adj[n] = (0, 0);
region[incr n] = "Oesophagus";            prognosis[n] = (0, 14.2)--(1,  7.9)--(2,  7.7)--(3,  5.4); adj[n] = (0, 6);
region[incr n] = "Liver, bile duct";      prognosis[n] = (0,  7.5)--(1,  5.8)--(2,  6.3)--(3,  7.6); adj[n] = (0, 0);
region[incr n] = "Pancreas";              prognosis[n] = (0,  4.0)--(1,  3.0)--(2,  2.7)--(3,  2.7); adj[n] = (0, 0);

vardef roundy(expr p) =
    (xpart point 0 of p, round(ypart point 0 of p)) for i=1 upto length p:
 -- (xpart point i of p, round(ypart point i of p)) endfor enddef;

beginfig(1);
    for i=1 upto n:
        prognosis[i] := roundy(prognosis[i]);
        path p; p = prognosis[i] xscaled 120 yscaled 12;
        undraw p withpen pencircle scaled 2; draw p withcolor 2/3 if odd i: blue else: red fi;
        for j=0 upto 3:
            picture t; t = thelabel(decimal ypart point j of prognosis[i], point j of p);
            unfill bbox t; draw t;
        endfor
        label.rt(region[i], point 0 of p shifted (-120, xpart adj[i]));
        label.rt(region[i], point 3 of p shifted (10, ypart adj[i]));
    endfor
    for i=0 upto 3:
        label.top(decimal (5+5i) & " year", (120i, 1200));
    endfor
    label.top("Estimates of \% survival rates", (180, 1220));

endfig;
\end{mplibcode}
\end{document}

