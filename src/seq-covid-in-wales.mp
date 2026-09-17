\documentclass[border=5mm]{standalone}
\usepackage{luamplib}
\usepackage{fontspec}
\usepackage{dwmpcode}
\setmainfont{Lato}
\begin{document}
\begin{mplibcode}
input basedate
input braces

numeric alpha; alpha = base(2020,1,1);
vardef date(expr y, m, d) = 
  (0, base(y, m, d) - alpha) scaled -512 
enddef;

string M[];
M1 = "Jan"; M2 = "Feb"; M3 = "Mar"; M4 = "Apr"; M5 = "May"; M6 = "Jun";
M7 = "Jul"; M8 = "Aug"; M9 = "Sep"; M10 = "Oct"; M11 = "Nov"; M12 = "Dec";

vardef mark_event(expr y, m, d, t, offset) = 
  save w; pair w; w = date(y, m, d);
  label.rt(TEX(t), w + offset);
  draw w -- w + offset withcolor 2/3 blue;
  draw w withpen pencircle scaled 3;
  undraw w withpen pencircle scaled 2;
enddef;

vardef mark_day(expr y, m, d, t, offset) = 
    save w; pair w; w = cjd(y, m, d);
    label.rt(decimal d & " " & M[m] & " – " & t, w + offset);
    draw w -- w + offset withcolor 2/3 blue;
    draw w withpen pencircle scaled 3;
    undraw w withpen pencircle scaled 2;
enddef;

vardef mark_period(expr ya, ma, da, yb, mb, db, t) = 
  save a, b, m; pair a, b, m; 
  a = date(ya, ma, da) shifted 4 right; 
  b = date(yb, mb, db) shifted 4 right;
  label.rt(TEX(t), do_coloured_brace(a, b, 5, 1/2, 2/3 blue));
enddef;


beginfig(1);
  % 30 months * 14 pt = 30*14/72 \simeq 5.83333 in
  % 365/12*30 = 30*14/912.5 \simeq 0.460274 so 1/2pt per day  

  drawarrow origin -- date(2022,6,30);
  for y = 2020,2021,2022:
    for m = 1 upto 12:
      pair w; w = date(y,m,1);
      if (y < 2022) or (m < 7):
        draw (left--right) scaled 2 shifted w;
        if m = 1: 
          label.lft(TEX("\textbf{" & decimal y & "}"), w); 
        elseif m mod 3 = 1:
          label.lft(TEX(M[m]), w);
        fi
      fi
    endfor
  endfor

  mark_event(2020,2,28,"28 Feb – \blue{First case in Wales}", 12 right);
  mark_event(2020,3,23,"23 Mar – \red{UK lockdown starts}", 12 right);
  mark_period(2020,6,1,2020,8,31, "\green{Gradual easing of lockdown}");
  mark_period(2020,9,1,2020,9,30, "\red{Local lockdowns}");
  mark_period(2020,10,23,2020,11,09, "\red{Firebreak lockdown}");
  mark_event(2020,12,16,"16 Dec – \blue{First vaccine given in Wales}", 13 dir 20);
  mark_event(2020,12,20,"20 Dec – \red{National lockdown}", 13 dir -20);
  mark_event(2021,2,20,"20 Feb – \green{Lockdown easing begins}", 13 dir 20);
  mark_event(2021,2,27,"27 Feb – \blue{Millionth jab given in Wales}", 13 dir -20);
  mark_period(2021,8,1,2021,8,31,"\green{Most restrictions relaxed}");
  mark_period(2021,12,1,2021,12,31,"\red{New Omicron restrictions}");
  mark_period(2022,1,7,2022,2,23, "\green{Omicron restrictions reversed}");
  mark_event(2022,3,15, "\green{Plan announced to end restrictions}", 12 right);
  mark_event(2022,5,15, "\green{Final restrictions lifted}", 12 right);

input show_name

endfig;
\end{mplibcode}
\end{document}
