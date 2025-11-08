\documentclass{standalone}
\usepackage{luamplib}
\usepackage{dwmpcode}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
input mpcolornames

def fancyname(expr s) =
  if substring (0, 5) of s = "Light":
    TEX("\small\textcolor{gray}{\texttt{Light}}\texttt{" & substring (5, length s) of s & "}")
  elseif substring (0, 4) of s = "Pale":
    TEX("\small\textcolor{gray}{\texttt{Pale}}\texttt{" & substring (4, length s) of s & "}")
  elseif substring (0, 4) of s = "Dark":
    TEX("\small\textcolor{violet}{\texttt{Dark}}\texttt{" & substring (4, length s) of s & "}")
  elseif substring (0, 4) of s = "Deep":
    TEX("\small\textcolor{violet}{\texttt{Deep}}\texttt{" & substring (4, length s) of s & "}")
  else:
    TEX("\small\texttt{" & s & "}")
  fi
enddef;

beginfig(1);

  n = 96; a = 360/n; t = a;
  forsuffixes c =
    Black,
    DimGrey,
    Grey,
    Silver,
    Gainsboro,
    WhiteSmoke,
    White,
    Snow,
    GhostWhite,
    Lavender,
    LavenderBlush,
    MistyRose,
    Seashell,
    OldLace,
    Cornsilk,
    FloralWhite,
    Ivory,
    Honeydew,
    MintCream,
    Azure,
    AliceBlue,
    RosyBrown,
    IndianRed,
    Brown,
    FireBrick,
    Maroon,
    Red,
    Salmon,
    Tomato,
    OrangeRed,
    Coral,
    Sienna,
    SaddleBrown,
    Chocolate,
    SandyBrown,
    PeachPuff,
    Peru,
    Linen,
    Bisque,
    AntiqueWhite,
    BurlyWood,
    Tan,
    BlanchedAlmond,
    NavajoWhite,
    PapayaWhip,
    Moccasin,
    Orange,
    Goldenrod,
    Wheat,
    Gold,
    Khaki,
    LemonChiffon,
    Beige,
    Olive,
    Yellow,
    OliveDrab,
    YellowGreen,
    GreenYellow,
    Chartreuse,
    LawnGreen,
    LimeGreen,
    ForestGreen,
    Green,
    Lime,
    SeaGreen,
    SpringGreen,
    Aquamarine,
    Turquoise,
    Teal,
    Cyan,
    CadetBlue,
    PowderBlue,
    DeepSkyBlue,
    SkyBlue,
    SteelBlue,
    DodgerBlue,
    SlateGrey,
    CornflowerBlue,
    RoyalBlue,
    MidnightBlue,
    Navy,
    Blue,
    SlateBlue,
    BlueViolet,
    Indigo,
    Thistle,
    Plum,
    Violet,
    Purple,
    Magenta,
    Orchid,
    VioletRed,
    DeepPink,
    HotPink,
    Crimson,
    Pink:

    fill (2.5 down -- 20 dir -9 -- 20 dir 9 -- 2.5 up -- cycle) shifted 100 right rotated t 
        withcolor c;
      picture name; name = fancyname(str c);
      if (t > 90) and (t < 270):
        draw thelabel.lft(name, 120 left) rotated (t-180);
      else:
        draw thelabel.rt(name, 120 right) rotated t;
      fi
      t := t + a;
    endfor

    label("The SVG names available with", 36 up);
    label("\mpl{input mpcolornames}", 20 up);

    numeric w; w = xpart (urcorner currentpicture - llcorner currentpicture);
    currentpicture := currentpicture scaled (5.4in / w);

endfig;
\end{mplibcode}
\end{document}
