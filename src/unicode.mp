\documentclass[border=5mm]{standalone}
\usepackage{luamplib}
\usepackage{fontspec} \newfontface\polytonic{GFS Porson}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
beginfig(1);

label("café noir £2.50", origin);
label(btex \vbox{\hsize 4in
 Nous étions à l'Étude, quand le Proviseur entra, suivi d'un
 \textit{nouveau} habillé en bourgeois et d'un garçon de classe
 qui portait un grand pupitre. Ceux qui dormaient se réveillèrent,
 et chacun se leva comme surpris dans son travail.
\par} etex, 60 down);
label(btex \vbox{\polytonic\halign{#\hfil\cr
μῆνιν ἄειδε θεὰ Πηληϊάδεω Ἀχιλῆος\cr
οὐλομένην, ἣ μυρί᾽ Ἀχαιοῖς ἄλγε᾽ ἔθηκε,\cr
πολλὰς δ᾽ ἰφθίμους ψυχὰς Ἄϊδι προΐαψεν\cr
ἡρώων, αὐτοὺς δὲ ἑλώρια τεῦχε κύνεσσιν\cr
οἰωνοῖσί τε πᾶσι, Διὸς δ᾽ ἐτελείετο βουλή,\cr
ἐξ οὗ δὴ τὰ πρῶτα διαστήτην ἐρίσαντε\cr
Ἀτρεΐδης τε ἄναξ ἀνδρῶν καὶ δῖος Ἀχιλλεύς.\cr}} etex, 220 down);
endfig;
\end{mplibcode}
\end{document}
