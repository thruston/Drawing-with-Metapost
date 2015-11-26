prologues:=3;outputtemplate:="%j%c.eps";

vardef decode(expr given) = 
  save a,b,i,s,out; string s, out; numeric a, b, i;
  out = ""; i=0;
  forever:
    i := i+1; s := substring(i-1,i) of given; a := ASCII s;
    if a < 128: 
    elseif a = 194: 
      i := i+1; s := substring (i-1,i) of given;
    elseif a = 195: 
      i := i+1; s := char (64 + ASCII substring (i-1,i) of given);
    else: 
      s := "?";
    fi
    out := out & s;
    exitif i >= length given;
  endfor
  out
enddef;

vardef decoder(expr given) =
  save out, s, a, b, c, p, i;
  string out, s; numeric a, b, c, p; out = ""; i=0;
  forever:
     i := i+1;
     s := substring (i-1,i) of given;
     a := ASCII s;
     if a < 128: 
       out := out & s; 
     elseif a < 192:
       % can't happen
     elseif a < 224:
       i := i+1; b := ASCII substring (i-1,i) of given;
       out := out &
       if     (a=194):             char b
       elseif (a=195):             char (b+64)
       elseif (a=196) and (b=177): char 17   %  dotlessi      ı 
       elseif (a=197) and (b=129): char 6    %  Lslash        Ł 
       elseif (a=197) and (b=130): char 7    %  lslash        ł 
       elseif (a=197) and (b=146): char 140  %  OElig         Œ 
       elseif (a=197) and (b=147): char 156  %  oelig         œ 
       elseif (a=197) and (b=160): char 138  %  Scaron        Š 
       elseif (a=197) and (b=161): char 154  %  scaron        š 
       elseif (a=197) and (b=184): char 159  %  Yumlaut       Ÿ 
       elseif (a=197) and (b=189): char 14   %  Zcaron        Ž 
       elseif (a=197) and (b=190): char 15   %  zcaron        ž 
       elseif (a=198) and (b=146): char 131  %     
       elseif (a=200) and (b=183): char 18   %  dotlessj      ȷ 
       elseif (a=203) and (b=134): char 136       
       elseif (a=203) and (b=135): char 16   %  caron         ˇ 
       elseif (a=203) and (b=152): char 11   %  breve         ˘ 
       elseif (a=203) and (b=153): char 1    %  dotaccent     ˙ 
       elseif (a=203) and (b=154): char 9    %  ring          ˚ 
       elseif (a=203) and (b=155): char 8    %  ogonek        ˛ 
       elseif (a=203) and (b=157): char 5    %  hungarumlaut  ˝ 
       elseif (a=207) and (b=128): char 29   %  pi            π 
       else:
          "[" & decimal a & "." & decimal b & "]"
       fi;
     elseif a < 240:
       i := i+1; b := ASCII substring (i-1,i) of given;
       i := i+1; c := ASCII substring (i-1,i) of given;
       out := out &
       if (a=226):  
          if     (b=130) and (c=172): char 128 % €
          elseif (b=136) and (c=171): char 129 
          elseif (b=128) and (c=154): char 130 
          elseif (b=128) and (c=158): char 132
          elseif (b=128) and (c=166): char 133
          elseif (b=128) and (c=160): char 134
          elseif (b=128) and (c=161): char 135
          elseif (b=128) and (c=176): char 137
          elseif (b=128) and (c=185): char 139
          elseif (b=136) and (c=154): char 142
          elseif (b=137) and (c=136): char 143
          elseif (b=128) and (c=156): char 147
          elseif (b=128) and (c=157): char 148
          elseif (b=128) and (c=162): char 149
          elseif (b=128) and (c=147): char 150
          elseif (b=128) and (c=148): char 151
          elseif (b=132) and (c=162): char 153
          elseif (b=128) and (c=186): char 155
          elseif (b=136) and (c=134): char 157
          elseif (b=151) and (c=138): char 158
          elseif (b=128) and (c=152): char 96  % ‘
          elseif (b=128) and (c=153): char 39  % ’
          elseif (b=129) and (c=132): char 4   %  fraction      ⁄ 
          elseif (b=136) and (c=146): char 12  %  minus         − 
          elseif (b=137) and (c=160): char 22  %  notequal      ≠ 
          elseif (b=136) and (c=158): char 23  %  infinity      ∞ 
          elseif (b=137) and (c=164): char 24  %  lessequal     ≤ 
          elseif (b=137) and (c=165): char 25  %  greaterequal  ≥ 
          elseif (b=136) and (c=130): char 26  %  partialdiff   ∂ 
          elseif (b=136) and (c=145): char 27  %  summation     ∑ 
          elseif (b=136) and (c=143): char 28  %  product       ∏ 
          else: "{226" & decimal b & decimal c & "}"
          fi
       elseif (a=239):
          if     (b=172) and (c=129): char 2   %  fi            ﬁ 
          elseif (b=172) and (c=130): char 3   %  fl            ﬂ 
          elseif (b=172) and (c=128): char 19  %  ff            ﬀ 
          elseif (b=172) and (c=131): char 20  %  ffi           ﬃ 
          elseif (b=172) and (c=132): char 21  %  ffl           ﬄ 
          else: "{239" & decimal b & decimal c & "}"
          fi
       else:
          "[" & decimal a & "." & decimal b & "." & decimal c & "]"
       fi;
     else:
       show a, "????";
     fi
     exitif i >= length given;
  endfor
  out
enddef;
     

%128  128 ×
% 64  192 
% 32  224 
% 16  240 

def do(expr s) = y:=y+14; if y>1200: y:= 0; x:=x+256; fi draw decode(s) infont "ugmr8r" shifted (x,y); enddef;

beginfig(1);
y = 0;
x = 0;
 do("0020   SPACE");
 do("0021 ! EXCLAMATION MARK");
 do("0022 " & ditto & " QUOTATION MARK");
 do("0023 # NUMBER SIGN");
 do("0024 $ DOLLAR SIGN");
 do("0025 % PERCENT SIGN");
 do("0026 & AMPERSAND");
 do("0027 ' APOSTROPHE");
 do("0028 ( LEFT PARENTHESIS");
 do("0029 ) RIGHT PARENTHESIS");
 do("002A * ASTERISK");
 do("002B + PLUS SIGN");
 do("002C , COMMA");
 do("002D - HYPHEN-MINUS");
 do("002E . FULL STOP");
 do("002F / SOLIDUS");
 do("0030 0 DIGIT ZERO");
 do("0031 1 DIGIT ONE");
 do("0032 2 DIGIT TWO");
 do("0033 3 DIGIT THREE");
 do("0034 4 DIGIT FOUR");
 do("0035 5 DIGIT FIVE");
 do("0036 6 DIGIT SIX");
 do("0037 7 DIGIT SEVEN");
 do("0038 8 DIGIT EIGHT");
 do("0039 9 DIGIT NINE");
 do("003A : COLON");
 do("003B ; SEMICOLON");
 do("003C < LESS-THAN SIGN");
 do("003D = EQUALS SIGN");
 do("003E > GREATER-THAN SIGN");
 do("003F ? QUESTION MARK");
 do("0040 @ COMMERCIAL AT");
 do("0041 A = A");
 do("0042 B = B");
 do("0043 C = C");
 do("0044 D = D");
 do("0045 E = E");
 do("0046 F = F");
 do("0047 G = G");
 do("0048 H = H");
 do("0049 I = I");
 do("004A J = J");
 do("004B K = K");
 do("004C L = L");
 do("004D M = M");
 do("004E N = N");
 do("004F O = O");
 do("0050 P = P");
 do("0051 Q = Q");
 do("0052 R = R");
 do("0053 S = S");
 do("0054 T = T");
 do("0055 U = U");
 do("0056 V = V");
 do("0057 W = W");
 do("0058 X = X");
 do("0059 Y = Y");
 do("005A Z = Z");
 do("005B [ LEFT SQUARE BRACKET");
 do("005C \ REVERSE SOLIDUS");
 do("005D ] RIGHT SQUARE BRACKET");
 do("005E ^ CIRCUMFLEX ACCENT");
 do("005F _ LOW LINE");
 do("0060 ` GRAVE ACCENT");
 do("0061 a small A");
 do("0062 b small B");
 do("0063 c small C");
 do("0064 d small D");
 do("0065 e small E");
 do("0066 f small F");
 do("0067 g small G");
 do("0068 h small H");
 do("0069 i small I");
 do("006A j small J");
 do("006B k small K");
 do("006C l small L");
 do("006D m small M");
 do("006E n small N");
 do("006F o small O");
 do("0070 p small P");
 do("0071 q small Q");
 do("0072 r small R");
 do("0073 s small S");
 do("0074 t small T");
 do("0075 u small U");
 do("0076 v small V");
 do("0077 w small W");
 do("0078 x small X");
 do("0079 y small Y");
 do("007A z small Z");
 do("007B { LEFT CURLY BRACKET");
 do("007C | VERTICAL LINE");
 do("007D } RIGHT CURLY BRACKET");
 do("007E ~ TILDE");
 do("00A0   NO-BREAK SPACE");
 do("00A1 ¡ INVERTED EXCLAMATION MARK");
 do("00A2 ¢ CENT SIGN");
 do("00A3 £ POUND SIGN");
 do("00A4 ¤ CURRENCY SIGN");
 do("00A5 ¥ YEN SIGN");
 do("00A6 ¦ BROKEN BAR");
 do("00A7 § SECTION SIGN");
 do("00A8 ¨ DIAERESIS");
 do("00A9 © COPYRIGHT SIGN");
 do("00AA ª FEMININE ORDINAL INDICATOR");
 do("00AB « LEFT-POINTING DOUBLE ANGLE QUOTATION MARK");
 do("00AC ¬ NOT SIGN");
 do("00AD ­ SOFT HYPHEN");
 do("00AE ® REGISTERED SIGN");
 do("00AF ¯ MACRON");
 do("00B0 ° DEGREE SIGN");
 do("00B1 ± PLUS-MINUS SIGN");
 do("00B2 ² SUPERSCRIPT TWO");
 do("00B3 ³ SUPERSCRIPT THREE");
 do("00B4 ´ ACUTE ACCENT");
 do("00B5 µ MICRO SIGN");
 do("00B6 ¶ PILCROW SIGN");
 do("00B7 · MIDDLE DOT");
 do("00B8 ¸ CEDILLA");
 do("00B9 ¹ SUPERSCRIPT ONE");
 do("00BA º MASCULINE ORDINAL INDICATOR");
 do("00BB » RIGHT-POINTING DOUBLE ANGLE QUOTATION MARK");
 do("00BC ¼ VULGAR FRACTION ONE QUARTER");
 do("00BD ½ VULGAR FRACTION ONE HALF");
 do("00BE ¾ VULGAR FRACTION THREE QUARTERS");
 do("00BF ¿ INVERTED QUESTION MARK");
 do("00C0 À = A WITH GRAVE");
 do("00C1 Á = A WITH ACUTE");
 do("00C2 Â = A WITH CIRCUMFLEX");
 do("00C3 Ã = A WITH TILDE");
 do("00C4 Ä = A WITH DIAERESIS");
 do("00C5 Å = A WITH RING ABOVE");
 do("00C6 Æ = AE");
 do("00C7 Ç = C WITH CEDILLA");
 do("00C8 È = E WITH GRAVE");
 do("00C9 É = E WITH ACUTE");
 do("00CA Ê = E WITH CIRCUMFLEX");
 do("00CB Ë = E WITH DIAERESIS");
 do("00CC Ì = I WITH GRAVE");
 do("00CD Í = I WITH ACUTE");
 do("00CE Î = I WITH CIRCUMFLEX");
 do("00CF Ï = I WITH DIAERESIS");
 do("00D0 Ð = ETH");
 do("00D1 Ñ = N WITH TILDE");
 do("00D2 Ò = O WITH GRAVE");
 do("00D3 Ó = O WITH ACUTE");
 do("00D4 Ô = O WITH CIRCUMFLEX");
 do("00D5 Õ = O WITH TILDE");
 do("00D6 Ö = O WITH DIAERESIS");
 do("00D7 × MULTIPLICATION SIGN");
 do("00D8 Ø = O WITH STROKE");
 do("00D9 Ù = U WITH GRAVE");
 do("00DA Ú = U WITH ACUTE");
 do("00DB Û = U WITH CIRCUMFLEX");
 do("00DC Ü = U WITH DIAERESIS");
 do("00DD Ý = Y WITH ACUTE");
 do("00DE Þ = THORN");
 do("00DF ß small SHARP S");
 do("00E0 à small A WITH GRAVE");
 do("00E1 á small A WITH ACUTE");
 do("00E2 â small A WITH CIRCUMFLEX");
 do("00E3 ã small A WITH TILDE");
 do("00E4 ä small A WITH DIAERESIS");
 do("00E5 å small A WITH RING ABOVE");
 do("00E6 æ small AE");
 do("00E7 ç small C WITH CEDILLA");
 do("00E8 è small E WITH GRAVE");
 do("00E9 é small E WITH ACUTE");
 do("00EA ê small E WITH CIRCUMFLEX");
 do("00EB ë small E WITH DIAERESIS");
 do("00EC ì small I WITH GRAVE");
 do("00ED í small I WITH ACUTE");
 do("00EE î small I WITH CIRCUMFLEX");
 do("00EF ï small I WITH DIAERESIS");
 do("00F0 ð small ETH");
 do("00F1 ñ small N WITH TILDE");
 do("00F2 ò small O WITH GRAVE");
 do("00F3 ó small O WITH ACUTE");
 do("00F4 ô small O WITH CIRCUMFLEX");
 do("00F5 õ small O WITH TILDE");
 do("00F6 ö small O WITH DIAERESIS");
 do("00F7 ÷ DIVISION SIGN");
 do("00F8 ø small O WITH STROKE");
 do("00F9 ù small U WITH GRAVE");
 do("00FA ú small U WITH ACUTE");
 do("00FB û small U WITH CIRCUMFLEX");
 do("00FC ü small U WITH DIAERESIS");
 do("00FD ý small Y WITH ACUTE");
 do("00FE þ small THORN");
 do("00FF ÿ small Y WITH DIAERESIS");
 do("0102 Ă = A WITH BREVE");
 do("0103 ă small A WITH BREVE");
 do("0104 Ą = A WITH OGONEK");
 do("0105 ą small A WITH OGONEK");
 do("0106 Ć = C WITH ACUTE");
 do("0107 ć small C WITH ACUTE");
 do("010C Č = C WITH CARON");
 do("010D č small C WITH CARON");
 do("010E Ď = D WITH CARON");
 do("010F ď small D WITH CARON");
 do("0110 Đ = D WITH STROKE");
 do("0111 đ small D WITH STROKE");
 do("0118 Ę = E WITH OGONEK");
 do("0119 ę small E WITH OGONEK");
 do("011A Ě = E WITH CARON");
 do("011B ě small E WITH CARON");
 do("0139 Ĺ = L WITH ACUTE");
 do("013A ĺ small L WITH ACUTE");
 do("013D Ľ = L WITH CARON");
 do("013E ľ small L WITH CARON");
 do("0141 Ł = L WITH STROKE");
 do("0142 ł small L WITH STROKE");
 do("0143 Ń = N WITH ACUTE");
 do("0144 ń small N WITH ACUTE");
 do("0147 Ň = N WITH CARON");
 do("0148 ň small N WITH CARON");
 do("0150 Ő = O WITH DOUBLE ACUTE");
 do("0151 ő small O WITH DOUBLE ACUTE");
 do("0152 Œ LATIN CAPITAL LIGATURE OE");
 do("0153 œ LATIN SMALL LIGATURE OE");
 do("0154 Ŕ = R WITH ACUTE");
 do("0155 ŕ small R WITH ACUTE");
 do("0158 Ř = R WITH CARON");
 do("0159 ř small R WITH CARON");
 do("015A Ś = S WITH ACUTE");
 do("015B ś small S WITH ACUTE");
 do("015E Ş = S WITH CEDILLA");
 do("015F ş small S WITH CEDILLA");
 do("0160 Š = S WITH CARON");
 do("0161 š small S WITH CARON");
 do("0162 Ţ = T WITH CEDILLA");
 do("0163 ţ small T WITH CEDILLA");
 do("0164 Ť = T WITH CARON");
 do("0165 ť small T WITH CARON");
 do("016E Ů = U WITH RING ABOVE");
 do("016F ů small U WITH RING ABOVE");
 do("0170 Ű = U WITH DOUBLE ACUTE");
 do("0171 ű small U WITH DOUBLE ACUTE");
 do("0178 Ÿ = Y WITH DIAERESIS");
 do("0179 Ź = Z WITH ACUTE");
 do("017A ź small Z WITH ACUTE");
 do("017B Ż = Z WITH DOT ABOVE");
 do("017C ż small Z WITH DOT ABOVE");
 do("017D Ž = Z WITH CARON");
 do("017E ž small Z WITH CARON");
 do("0192 ƒ small F WITH HOOK");
 do("02C6 ˆ MODIFIER LETTER CIRCUMFLEX ACCENT");
 do("02C7 ˇ CARON");
 do("02D8 ˘ BREVE");
 do("02D9 ˙ DOT ABOVE");
 do("02DB ˛ OGONEK");
 do("02DC ˜ SMALL TILDE");
 do("02DD ˝ DOUBLE ACUTE ACCENT");
 do("2013 – EN DASH");
 do("2014 — EM DASH");
 do("2018 ‘ LEFT SINGLE QUOTATION MARK");
 do("2019 ’ RIGHT SINGLE QUOTATION MARK");
 do("201A ‚ SINGLE LOW-9 QUOTATION MARK");
 do("201C “ LEFT DOUBLE QUOTATION MARK");
 do("201D ” RIGHT DOUBLE QUOTATION MARK");
 do("201E „ DOUBLE LOW-9 QUOTATION MARK");
 do("2020 † DAGGER");
 do("2021 ‡ DOUBLE DAGGER");
 do("2022 • BULLET");
 do("2026 … HORIZONTAL ELLIPSIS");
 do("2030 ‰ PER MILLE SIGN");
 do("2039 ‹ SINGLE LEFT-POINTING ANGLE QUOTATION MARK");
 do("203A › SINGLE RIGHT-POINTING ANGLE QUOTATION MARK");
 do("20AC € EURO SIGN");
 do("2122 ™ TRADE MARK SIGN");


endfig;

beginfig(2);

  draw "café noir £2.50" infont "pncr8r";
  draw decode("café noir £2.50") infont "pncr8r" shifted 12 down;

  defaultfont := "pncr8r";
  label.rt("café noir £2.50", 24 down);
  label.rt(decode("café noir £2.50"), 36 down);

endfig;


end

