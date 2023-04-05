prologues := 3;
outputtemplate := "%j%c.eps";
input colorbrewer-rgb
vardef tt(text t) =
    save n, a; numeric n, a[]; n = 0;
    forsuffixes $=t:
        a[incr n] = $;
    endfor


    forsuffixes $=1,2,3: show a$; endfor
enddef;


    tt(3,4,5);

        for i = 1 upto 3:
            numeric j, k;
            j = i mod 3 + 1;
            k = j mod 3 + 1;
            show (i, j, k);
        endfor


end.

