prologues := 3;
outputtemplate := "trad-font-changes.eps";
beginfig(1);
yy := 120; 
forsuffixes $ = 
    font_times, 
    font_palatino,
    font_charter, 
    font_utopia,
    font_cmbright, 
    font_century, 
    font_concrete,
    font_bookman, 
    font_arev:
   draw str $ infont "texnansi-lmtt10" shifted (-22,yy) withcolor .43 green;
   write "draw btex \input " & str $ & " {\bf NB}. Learn $v=u+at$ right {\it now\/}! etex shifted (80," & decimal yy & ");" to ".mplabels";
   yy := yy - 16;
endfor
  write EOF to ".mplabels";
  input .mplabels;
endfig;
end.

