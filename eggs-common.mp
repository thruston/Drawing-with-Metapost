color eggshell, dark_eggshell, light_eggshell;
eggshell = 3/4[1/4[red, green], white];
dark_eggshell = 1/2[1/4[red, green], white];
light_eggshell = 7/8[3/16[red, green], white];

vardef numbered_points(expr egg) = image(
    for i=1 upto length egg: 
        draw point i of egg;
        label(decimal i, point i of egg scaled 1.06);
    endfor;
) enddef;
