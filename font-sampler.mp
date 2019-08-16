% pagk AvantGarde-Book 
% pagko AvantGarde-BookOblique 
% pagd AvantGarde-Demi 
% pagdo AvantGarde-DemiOblique 
% pbkd Bookman-Demi 
% pbkdi Bookman-DemiItalic 
% pbkl Bookman-Light 
% pbkli Bookman-LightItalic 
% pcrb Courier-Bold 
% pcrbo Courier-BoldOblique 
% pcrr Courier 
% pcrro Courier-Oblique 
% phvb Helvetica-Bold 
% phvbo Helvetica-BoldOblique 
% phvbrn Helvetica-NarrowBold 
% phvbon Helvetica-NarrowBoldOblique 
% phvr Helvetica 
% phvro Helvetica-Oblique 
% phvrrn Helvetica-Narrow 
% phvron Helvetica-NarrowOblique 
% pncb NewCenturySchlbk-Bold 
% pncbi NewCenturySchlbk-BoldItalic 
% pncri NewCenturySchlbk-Italic 
% pncr NewCenturySchlbk-Roman 
% pplb Palatino-Bold 
% pplbi Palatino-BoldItalic 
% pplri Palatino-Italic 
% pplr Palatino-Roman 
% psyr Symbol 
% ptmb Times-Bold 
% ptmbi Times-BoldItalic 
% ptmri Times-Italic 
% ptmr Times-Roman 
% pzcmi ZapfChancery-MediumItalic 
% pzdr ZapfDingbats
% for $="ugmr8r", "ugmri8r":
%md-chr8t MathDesign-CH-Regular-T1-10 <md-chr8t.pfb
%md-chr8y CharterBT-Roman " TeXnANSIEncoding ReEncodeFont " <texnansi.enc <bchr8a.pfb
%md-chrc8y CharterBT-SmallCap " TeXnANSIEncoding ReEncodeFont " <texnansi.enc <bchrc8a.pfb
%md-chri7m MathDesign-CH-Regular-Italic-MathItalic-10 <md-chri7m.pfb
%md-chri7t MathDesign-CH-Regular-Italic-OT1-10 <md-chri7t.pfb
%md-chri8c MathDesign-CH-Regular-Italic-TS1-10 <md-chri8c.pfb
%md-chri8t MathDesign-CH-Regular-Italic-T1-10 <md-chri8t.pfb
%md-chri8y CharterBT-Italic " TeXnANSIEncoding ReEncodeFont " <texnansi.enc <bchri8a.pfb
%md-chrma MathDesign-CH-Regular-MathDesignSymbolA-10 <md-chrma.pfb
%md-chrmb MathDesign-CH-Regular-MathDesignSymbolB-10 <md-chrmb.pfb
prologues := 3;
outputtemplate := "%j%c.eps";
beginfig(1);
ypos = 0;
picture glyph; 
%for $="eurm10", "cmmi10", "grmn1000", "gporsonrg6r", "gneohellenicrg6r":
for $="texnansi-lmr10", "pplr8r":
  draw ("Font: " & $) infont "texnansi-lmss10" scaled .7 shifted (-20,ypos) withcolor .67 red;
  for m=0 upto 15:
    ypos := ypos - 12;
    if (m mod 4)=0:
      ypos := ypos - 4;
    fi
    draw decimal 16m infont "texnansi-lmss10" scaled .7 shifted (-20,ypos) withcolor .67 red;
    for c=0 upto 15:
      xx := 16m+c;
      if (xx<>0) and (xx<>10) and (xx<>13) and (xx<>160):
        glyph := char (16m+c) infont $;
        draw glyph shifted (c*14,ypos) shifted 1/2(llcorner glyph - lrcorner glyph) 
          withcolor if ((32<xx) and (xx<127)) or (160<xx): black else: .67 blue fi;
      else:
        draw unitsquare shifted 1/2 left scaled 3 shifted (c*14,ypos) withcolor .67 red;
      fi
    endfor
  endfor
  for i=0 upto 4: draw (-7+56i,ypos-4) -- (-7+56i,ypos+17*12-4) withcolor .67 red; endfor
  ypos := ypos - 24;
endfor

endfig;


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
undraw 30 down -- 152 up;
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


beginfig(3);
yy := 120; 
forsuffixes $ = font_times, font_charter, font_utopia, font_century, font_palatino, font_bookman, font_arev, font_cmbright, font_concrete:
   draw ("\input " & str $) infont "texnansi-lmtt10" shifted (-42,yy) withcolor .67 red;
   write "draw btex \input " & str $ & " {\bf NB}. Learn $v=at+v_0$ right {\it now\/}! etex shifted (80," & decimal yy & ");" to ".mplabels";
   yy := yy - 16;
endfor
  write EOF to ".mplabels";
  input .mplabels;

endfig;


    end.

