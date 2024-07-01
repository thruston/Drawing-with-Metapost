\documentclass[border=5mm]{standalone}
\usepackage{luamplib}
\usepackage{dwmpcode}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}


path s, c; 

s = origin -- 80 right;
c = quartercircle scaled 40;

labeloffset := 20;

vardef make_arrows(expr t) = image(
    picture A, B;
    A = image(drawarrow s; drawarrow c;);
    B = image(drawdblarrow s; drawdblarrow c;);
    label.lft(A, origin);
    label.rt(B, origin);
    picture T; T = thelabel("\texttt{" & t & "}", 8 down); bboxmargin := 4; path p; p = bbox T;
    path S; S = superellipse(point 3/2 of p, point 5/2 of p, point 7/2 of p, point 1/2 of p, 0.78);
    string x; x = substring (0, 1) of t;
    fill S withcolor if x = "m": 7/8[red, white] elseif x = "c": 7/8[blue, white] else: white fi;
    draw S; draw T;
) enddef;

beginfig(1);

    label("\mpl{drawarrow}", (-60, 28));
    label("\mpl{drawdblarrow}", (60, 28));

    pair v; v = 40 down;

    draw make_arrows("1");

    ahangle := 20; ahlength := 6;
    draw make_arrows("2") shifted v;

    ahangle := 45; ahlength := 4;
input mparrows
setarrows(open); draw make_arrows("mp1") shifted 2.5v;
setarrows(defaultunfilled); draw make_arrows("mp2") shifted 3.5v;
setarrows(barbed); draw make_arrows("mp3") shifted 4.5v;


input cmarrows
setup_cmarrows(macro_name="drawarrow";    arrow_name="texarrow";    parameter_file="cmr10.mf");
setup_cmarrows(macro_name="drawdblarrow"; arrow_name="twowayarrow"; parameter_file="cmr10.mf");
    draw make_arrows("cm1") shifted 6v;
setup_cmarrows(arrow_name="lefthalfarrow"; parameter_file="cmr10.mf"; macro_name="drawarrow");
setup_cmarrows(arrow_name="paralleloppositelefthalfarrows"; parameter_file="cmr10.mf"; macro_name="drawdblarrow");
    draw make_arrows("cm2") shifted 7v;

endfig;
\end{mplibcode}
\end{document}

