\documentclass{standalone}
\usepackage{luamplib}
\usepackage{dwmpcode}
\usepackage[x11names]{xcolor}
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

  n = 79; a = 360/n; t = a;
  forsuffixes c =
    Snow,
    MistyRose,
    RosyBrown,
    IndianRed,
    Brown,
    Firebrick,
    Red,
    OrangeRed,
    Tomato,
    Coral,
    Salmon,
    LightSalmon,
    Sienna,
    Chocolate,
    Tan,
    DarkOrange,
    Orange,
    PeachPuff,
    Bisque,
    Seashell,
    AntiqueWhite,
    Burlywood,
    NavajoWhite,
    Wheat,
    Cornsilk,
    DarkGoldenrod,
    Goldenrod,
    LightGoldenrod,
    Gold,
    LemonChiffon,
    Khaki,
    Ivory,
    LightYellow,
    Yellow,
    OliveDrab,
    DarkOliveGreen,
    Honeydew,
    Chartreuse,
    PaleGreen,
    Green,
    SeaGreen,
    DarkSeaGreen,
    SpringGreen,
    Aquamarine,
    Azure,
    LightCyan,
    Cyan,
    PaleTurquoise,
    Turquoise,
    CadetBlue,
    LightSkyBlue,
    SkyBlue,
    DeepSkyBlue,
    LightSteelBlue,
    SteelBlue,
    DodgerBlue,
    SlateBlue,
    SlateGray,
    DarkSlateGray,
    RoyalBlue,
    LightBlue,
    Blue,
    MediumPurple,
    Purple,
    DarkOrchid,
    MediumOrchid,
    Orchid,
    Thistle,
    Plum,
    Magenta,
    Maroon,
    DeepPink,
    HotPink,
    VioletRed,
    PaleVioletRed,
    Pink,
    LightPink,
    LavenderBlush:

      for i = 1 upto 4:
        draw (124 - 9i + i*i*i/24) * dir t withpen pencircle scaled (8 - 3/4 i) withcolor c[i];
      
      endfor
      picture name; name = fancyname(str c);
      if (t > 90) and (t < 270):
        draw thelabel.lft(name, 120 left) rotated (t-180);
      else:
        draw thelabel.rt(name, 120 right) rotated t;
      fi
      t := t + a;
    endfor
    for i = 1 upto 4:
      label(TEX("\small\texttt{" & decimal i & "}") scaled (1.2-(i/8)), (124 - 9i + i*i*i/24) * right);
    endfor

    label("The X11 names available with", 36 up);
    label("\mpl{input mpcolornames}", 20 up);
    label("Each colour has four suffixes: 1–4", 4 up);
    label("\textcolor{Coral4}{\texttt{Coral4}} is darker than \textcolor{Coral1}{\texttt{Coral1}}", 12 down);
    label("\textcolor{Gold4}{\texttt{Gold4}} is darker than \textcolor{Gold1}{\texttt{Gold1}}", 28 down);
    label("and so on\dots", 44 down);

    numeric w; w = xpart (urcorner currentpicture - llcorner currentpicture);
    currentpicture := currentpicture scaled (5.4in / w);

endfig;
\end{mplibcode}
\end{document}
