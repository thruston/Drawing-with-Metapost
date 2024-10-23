prologues := 3; outputtemplate := "%j.eps";
verbatimtex
\documentclass{article}
\usepackage{listings}
\usepackage{xcolor}
\newcommand\mpstyle{\lstset{language=Metapost,
basicstyle=\ttfamily,columns=fullflexible,commentstyle=\color{red},
frame=none,keepspaces=true,showstringspaces=false}}
\lstnewenvironment{code}[1][]{\mpstyle\lstset{#1}}{}
\begin{document}
etex
beginfig(1);
picture P; P = thelabel(btex \vbox{\begin{code}
  % special operators
  vardef incr suffix $ = $:=$+1; $ enddef;
  vardef decr suffix $ = $:=$-1; $ enddef;
  def reflectedabout(expr w,z) = % reflects about the line w..z
   transformed begingroup transform T_;
     w transformed T_ = w;  
     z transformed T_ = z;
     xxpart T_ = -yypart T_; 
     xypart T_ = yxpart T_; % T_ is a reflection
  T_ endgroup enddef;
\end{code}} etex, origin);
fill bbox P withcolor (1,1,31/32); draw P; draw bbox P;
endfig; end.
