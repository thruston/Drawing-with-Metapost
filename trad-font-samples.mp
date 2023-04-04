\documentclass[border=5mm]{standalone}
\usepackage{luamplib}
\begin{document}
\begin{mplibcode}
beginfig(1);

vardef set_line(expr f, n) =
  save code, name, sample;
  picture code, name, sample;
  code = f infont "cs-lmtt10";
  name = n infont "cs-lmss10";
  sample = "Hand in glove 42" infont f;
  yy := yy - 14;
  draw code shifted (-48,yy);
  draw name shifted (0,yy);
  draw sample shifted (124,yy);
  enddef;

vardef set_symbol_line(expr f, n) =
  save code, name, sample;
  picture code, name, sample;
  code = f infont "cs-lmtt10";
  name = n infont "cs-lmss10";
  sample = (char 97 & char 98 & char 99 & char 100 & char 101 & char 102) infont f;
  yy := yy - 14;
  draw code shifted (-48,yy);
  draw name shifted (0,yy);
  draw sample shifted (124,yy);
  enddef;


beginfig(2);
yy := 150;
set_line("pagk8r","Avant Garde"); 
set_line("pbkl8r","Bookman"); 
set_line("pcrr8r","Courier"); 
set_line("phvr8r","Helvetica"); 
set_line("pncr8r","New Century Schoolbook"); 
set_line("pplr8r","Palatino"); 
set_line("ptmr8r","Times"); 
set_line("pzcmi8r","Zapf Chancery"); 
yy := yy - 6;
set_symbol_line("pzdr","Zapf Dingbats");
set_symbol_line("psyr","Symbol"); 
set_symbol_line("eurm10","Euler");

endfig;
\end{mplibcode}
\end{document}

