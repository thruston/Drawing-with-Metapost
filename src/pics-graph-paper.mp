vardef grid(expr p, grid_unit) = 
  save llx, lly, urx, ury; 
  (llx, lly) = llcorner p - (bboxmargin, bboxmargin); 
  (urx, ury) = urcorner p + (bboxmargin, bboxmargin);
  image(
    for x = 1 + floor(llx / grid_unit) upto floor(urx / grid_unit):
      draw (x * grid_unit, lly) -- (x * grid_unit, ury);
    endfor
    for y = 1 + floor(lly / grid_unit) upto floor(ury / grid_unit):
      draw (llx, y * grid_unit) -- (urx, y * grid_unit);
    endfor
    if (llx < 0) and (lly < 0) and (urx > 0) and (ury > 0): 
      draw fullcircle scaled 3; % show origin if in range
    fi
  )
enddef;

  picture P; P = currentpicture; currentpicture := nullpicture;
  drawoptions(withpen pencircle scaled 1/4);
    draw grid(P, 1mm) withcolor Blues 8 3;
    draw grid(P, 1cm) withcolor Blues 8 5;
  drawoptions();
  draw P;
endfig;
\end{mplibcode}
\end{document}

