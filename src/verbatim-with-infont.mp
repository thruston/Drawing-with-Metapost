prologues := 3;
outputtemplate := "%j.eps";
beginfig(1);
    string s; s = "\TeX\ sets maths like this $e=mc^2$";
    draw ("1. " & s) infont defaultfont;
    draw ("2. " & s) infont "texnansi-lmr10"  shifted 20 down;
    draw ("3. " & s) infont "cmtt10"          shifted 40 down;
    draw ("4. " & s) infont "texnansi-lmtt10" shifted 60 down;
    bboxmargin := 14;
    picture p; p = currentpicture; fill bbox currentpicture withcolor (1,1,31/32); draw p; 
    draw bbox p;
endfig;
end.
