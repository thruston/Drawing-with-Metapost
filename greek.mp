prologues := 3;
outputtemplate := "%j%c.eps";

beginfig(1);
string ab, AB;

ab = ("" for i=11 upto 23: & char i endfor 
   & "o" for i=24 upto 33: & char i endfor);

AB = ("AB" & char 0 & char 1 & "EZH" & char 2 & "IK" 
          & char 3 & "MNO" & char 4 & char 5 & "P"
          & char 6 & "T"   & char 7 & char 8 & "X"
          & char 9 & char 10);

draw ab infont "cmmi10";
draw AB infont "cmmi10" shifted 12 down;
draw ab infont "eurm10" shifted 32 down;
draw AB infont "eurm10" shifted 44 down;
%
%AB\0\1  EZH\2 IK\3M NO\4\5 P\6T\7 \8X\9\10

undraw (6 left -- 180 right) shifted 12 up;
undraw (6 left -- 180 right) shifted 50 down;

endfig;

beginfig(2);

string ab, AB;
ab = "abgdezhjiklmnoxprstufqyw";
AB = "ABGDEZHJIKLMNOXPRSTUFQYW";

y := 0;
for $="grmn1000", "gporsonrg6r", "gneohellenicrg6r":
  draw $ infont "cmss10" scaled 0.8 shifted (0,y) withcolor .67 red;
  draw ab infont $ shifted (0,y-10);
  draw AB infont $ shifted (0,y-22);
  y := y - 40;
endfor

undraw (6 left -- 180 right) shifted 12 up;
undraw (6 left -- 180 right) shifted 108 down;

endfig;

beginfig(3);


picture homer;
homer = ("m" & char 168 & "nin=" & char 138 & "eide="  
        & "je" & char 128 & "=Phlh" & char 240 & char 136 
        & "deiw=>Aqil" & char 168 & "oc") infont "gporsonrg6r";
undraw 10 left -- 272 right;
draw homer scaled 1.732 withcolor .67 red;
endfig;

end.

