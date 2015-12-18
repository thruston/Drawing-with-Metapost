prologues:=3;outputtemplate:="%j%c.eps";
beginfig(1);

show ASCII substring (0,1) of decimal -1;
    u = 8mm;
    defaultfont := "texnansi-lmr10";
    string minus_sign;
    minus_sign := char 143; % if you are using the texnansi encoding
    %minus_sign := char 12;  % if you are using the 8r encoding
    for x=-3 upto 3: label(decimal x, (x*u,+9)) withcolor .67 red; endfor
    for x=-3 upto 3: label(if x<0: minus_sign & fi decimal abs(x), (x*u,-5)) withcolor .58 blue; endfor
    label.lft("with plain decimal:" infont "texnansi-lmss10" scaled 0.9, (-3.6u,9)) withcolor .67 red;
    label.lft("with this hack:" infont "texnansi-lmss10" scaled 0.9, (-3.6u,-5)) withcolor .58 blue;

endfig;

verbatimtex
\def\s#1{\let\\\cr\vbox{\halign{\hfil\strut ##\hfil\cr#1\crcr}}}
etex

beginfig(2);

label(btex \s{What's\\new?} etex, origin);

endfig;
end

