\documentclass[border=5mm]{standalone}
\usepackage{luamplib}
\usepackage{dwmpcode}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
% White              0     0     0     0  (0,0,0,0)              0     0
% Yellow             0     0     1     0  (0,0,1,0)              1     0
% Goldenrod          0  0.10  0.84     0  (0,0.10,0.84,0)     0.94     0
% Dandelion          0  0.29  0.84     0  (0,0.29,0.84,0)     1.13     0
% Apricot            0  0.32  0.52     0  (0,0.32,0.52,0)     0.84     0
% YellowOrange       0  0.42     1     0  (0,0.42,1,0)        1.42     0
% Melon              0  0.46  0.50     0  (0,0.46,0.50,0)     0.96     0
% Lavender           0  0.48     0     0  (0,0.48,0,0)        0.48     0
% Peach              0  0.50  0.70     0  (0,0.50,0.70,0)     1.20     0
% BurntOrange        0  0.51     1     0  (0,0.51,1,0)        1.51     0
% Salmon             0  0.53  0.38     0  (0,0.53,0.38,0)     0.91     0
% Orange             0  0.61  0.87     0  (0,0.61,0.87,0)     1.48     0
% CarnationPink      0  0.63     0     0  (0,0.63,0,0)        0.63     0
% RedOrange          0  0.77  0.87     0  (0,0.77,0.87,0)     1.64     0
% VioletRed          0  0.81     0     0  (0,0.81,0,0)        0.81     0
% Rhodamine          0  0.82     0     0  (0,0.82,0,0)        0.82     0
% WildStrawberry     0  0.96  0.39     0  (0,0.96,0.39,0)     1.35     0
% Magenta            0     1     0     0  (0,1,0,0)              1     0
% RubineRed          0     1  0.13     0  (0,1,0.13,0)        1.13     0
% OrangeRed          0     1  0.50     0  (0,1,0.50,0)        1.50     0
% Red                0     1     1     0  (0,1,1,0)              2     0
% Thistle         0.12  0.59     0     0  (0.12,0.59,0,0)     0.71     0
% Tan             0.14  0.42  0.56     0  (0.14,0.42,0.56,0)  1.12     0
% GreenYellow     0.15     0  0.69     0  (0.15,0,0.69,0)     0.84     0
% SpringGreen     0.26     0  0.76     0  (0.26,0,0.76,0)     1.02     0
% Orchid          0.32  0.64     0     0  (0.32,0.64,0,0)     0.96     0
% DarkOrchid      0.40  0.80  0.20     0  (0.40,0.80,0.20,0)  1.40     0
% YellowGreen     0.44     0  0.74     0  (0.44,0,0.74,0)     1.18     0
% Purple          0.45  0.86     0     0  (0.45,0.86,0,0)     1.31     0
% LimeGreen       0.50     0     1     0  (0.50,0,1,0)        1.50     0
% Plum            0.50     1     0     0  (0.50,1,0,0)        1.50     0
% Periwinkle      0.57  0.55     0     0  (0.57,0.55,0,0)     1.12     0
% SkyBlue         0.62     0  0.12     0  (0.62,0,0.12,0)     0.74     0
% CadetBlue       0.62  0.57  0.23     0  (0.62,0.57,0.23,0)  1.42     0
% CornflowerBlue  0.65  0.13     0     0  (0.65,0.13,0,0)     0.78     0
% SeaGreen        0.69     0  0.50     0  (0.69,0,0.50,0)     1.19     0
% RoyalPurple     0.75  0.90     0     0  (0.75,0.90,0,0)     1.65     0
% Violet          0.79  0.88     0     0  (0.79,0.88,0,0)     1.67     0
% Aquamarine      0.82     0  0.30     0  (0.82,0,0.30,0)     1.12     0
% Turquoise       0.85     0  0.20     0  (0.85,0,0.20,0)     1.05     0
% BlueGreen       0.85     0  0.33     0  (0.85,0,0.33,0)     1.18     0
% Cerulean        0.94  0.11     0     0  (0.94,0.11,0,0)     1.05     0
% NavyBlue        0.94  0.54     0     0  (0.94,0.54,0,0)     1.48     0
% ProcessBlue     0.96     0     0     0  (0.96,0,0,0)        0.96     0
% JungleGreen     0.99     0  0.52     0  (0.99,0,0.52,0)     1.51     0
% Cyan               1     0     0     0  (1,0,0,0)              1     0
% Emerald            1     0  0.50     0  (1,0,0.50,0)        1.50     0
% Green              1     0     1     0  (1,0,1,0)              2     0
% RoyalBlue          1  0.50     0     0  (1,0.50,0,0)        1.50     0
% Blue               1     1     0     0  (1,1,0,0)              2     0
% Mulberry        0.34  0.90     0  0.02  (0.34,0.90,0,0.02)  1.24  0.02
% TealBlue        0.86     0  0.34  0.02  (0.86,0,0.34,0.02)  1.20  0.02
% BlueViolet      0.86  0.91     0  0.04  (0.86,0.91,0,0.04)  1.77  0.04
% Fuchsia         0.47  0.91     0  0.08  (0.47,0.91,0,0.08)  1.38  0.08
% ForestGreen     0.91     0  0.88  0.12  (0.91,0,0.88,0.12)  1.79  0.12
% Bittersweet        0  0.75     1  0.24  (0,0.75,1,0.24)     1.75  0.24
% PineGreen       0.92     0  0.59  0.25  (0.92,0,0.59,0.25)  1.51  0.25
% BrickRed           0  0.89  0.94  0.28  (0,0.89,0.94,0.28)  1.83  0.28
% Maroon             0  0.87  0.68  0.32  (0,0.87,0.68,0.32)  1.55  0.32
% RedViolet       0.07  0.90     0  0.34  (0.07,0.90,0,0.34)  0.97  0.34
% Mahogany           0  0.85  0.87  0.35  (0,0.85,0.87,0.35)  1.72  0.35
% OliveGreen      0.64     0  0.95  0.40  (0.64,0,0.95,0.40)  1.59  0.40
% MidnightBlue    0.98  0.13     0  0.43  (0.98,0.13,0,0.43)  1.11  0.43
% RawSienna          0  0.72     1  0.45  (0,0.72,1,0.45)     1.72  0.45
% Gray               0     0     0  0.50  (0,0,0,0.50)           0  0.50
% Brown              0  0.81     1  0.60  (0,0.81,1,0.60)     1.81  0.60
% Sepia              0  0.83     1  0.70  (0,0.83,1,0.70)     1.83  0.70
% Black              0     0     0     1  (0,0,0,1)              0     1
input mpcolornames
dvipsnames;
beginfig(1);
  n = 68; a = 360/n;
  path wedge; 
  wedge = (0, -6) -- (24, -7) -- (24, 7) -- (0, 6) -- cycle;
  wedge := wedge shifted 154 right;
  i = 0;
  forsuffixes $=  
    White,
    Red,
    OrangeRed,
    RedOrange,
    Orange,
    YellowOrange,
    Yellow,
    GreenYellow,
    YellowGreen,
    Green,
    BlueGreen,
    Blue,
    BlueViolet,
    Violet,
    RedViolet,
    VioletRed,
    Magenta,
    Bittersweet,
    Dandelion,
    Goldenrod,
    Lavender,
    CarnationPink,
    Thistle,
    Orchid,
    DarkOrchid,
    Fuchsia,
    Periwinkle,
    CornflowerBlue,
    Plum,
    Mulberry,
    WildStrawberry,
    BurntOrange,
    Peach,
    Melon,
    Apricot,
    Salmon,
    Rhodamine,
    RubineRed,
    Maroon,
    Purple,
    RoyalPurple,
    RoyalBlue,
    MidnightBlue,
    NavyBlue,
    CadetBlue,
    SkyBlue,
    ProcessBlue,
    TealBlue,
    Cerulean,
    Cyan,
    Turquoise,
    Aquamarine,
    Emerald,
    JungleGreen,
    SpringGreen,
    LimeGreen,
    SeaGreen,
    ForestGreen,
    PineGreen,
    OliveGreen,
    Tan,
    BrickRed,
    Mahogany,
    RawSienna,
    Brown,
    Sepia,
    Black,
    Gray:
    numeric theta; theta = incr i * a;
    filldraw wedge rotated theta withcolor $;
    if str $ = "White": 
      draw wedge rotated theta withpen pencircle scaled 1/4;
    fi
    if (theta > 90) and (theta < 270):
      label.rt(TEX("\texttt{" & str $ & "}") rotated 180, 180 right) rotated theta;
    else:
      label.rt("\texttt{" & str $ & "}", 180 right) rotated theta;
    fi
  endfor

vardef sector(expr name, a, b) = 
  save r; r = 144;
  save s, t; s = 360/68; t = 8/68;

  draw (origin -- 3 right) shifted (r, 0) rotated (a * s);
  draw (origin -- 3 right) shifted (r, 0) rotated (b * s);
  draw subpath (a * t, b * t) of fullcircle scaled 2r;
  save theta; theta = 1/2(a+b) * s;
  save p; picture p; p = thelabel(name, origin) rotated if theta < 180: - fi 90 shifted (r,0); 
  unfill bbox p rotated theta; 
         draw p rotated theta;
  
enddef;

sector("\textsf{Palette}", 2, 16);
sector("\textsf{Flowers}", 18, 28);
sector("\textsf{Fruits}", 29, 35);
sector("\textsf{Blues}", 42, 49);
sector("\textsf{Greens}", 51, 60);
sector("\textsf{Earths}", 61, 66);


label("The DVIPS names available with", 36 up);
label.rt("\mpl{input mpcolornames}", (-60,18));
label.rt("\mpl{divpsnames;}",        (-60,6));
label("These are defined as \mpl{cmykcolor} values.", 10 down);
label("Notice that the names are all", 26 down);
label("written in CamelCase.", 42 down);


numeric w; w = xpart (urcorner currentpicture - llcorner currentpicture);
currentpicture := currentpicture scaled (5.4in / w);


      

endfig;
\end{mplibcode}
\end{document}
