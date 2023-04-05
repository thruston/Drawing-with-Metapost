\documentclass[border=8pt]{standalone}
\usepackage{luamplib}
\begin{document}
\begin{mplibcode}
beginfig(1);
    for i=0 upto 15: 
        label.top(decimal i infont "cmss10" scaled 0.7, (15i,108)) withcolor .67 red;
        for j=0 upto 7:
            draw char (i+16j) infont "eurm10" shifted (15i-3,97-14j);
            if i=0: 
                label.lft(decimal 16j infont "cmss10" scaled 0.7, (-8,100-14j)) withcolor .67 red; 
            fi
            % if (i + 16j) > 0:
            %     draw char (i + 16j) infont "cmmi10" 
            %         scaled 0.5 
            %         shifted (15i - 6, 97-14j)
            %         withcolor .67 blue;
            % fi
        endfor 
    endfor
endfig;
\end{mplibcode}
\end{document}

