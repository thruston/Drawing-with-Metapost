vardef clock_roman primary h = 
   if     h<5: ""  for i=1 upto h: & "I" endfor
   elseif h<9: "V" for i=6 upto h: & "I" endfor
   elseif h=9: "IX"
   else:       "X" for i=11 upto h: & "I" endfor
   fi
enddef;

path hand[]; 
hand1 = origin .. (.257,1/50) .. (.377,1/60) & (.377,1/60) {up} .. (.40,3/50) .. (.60, 1/40) .. {right} (.75,0);
hand1 := (hand1 .. reverse hand1 reflectedabout(left,right) .. cycle) scaled 50;

hand2 = origin  .. (.60, 1/64) .. {right} (.925,0);
hand2 := (hand2 .. reverse hand2 reflectedabout(left,right) .. cycle) scaled 50;

% hour of the day to degrees
vardef htod(expr hours)   = 30*((15-hours)   mod 12) enddef;
vardef mtod(expr minutes) =  6*((75-minutes) mod 60) enddef;

vardef clock(expr hours, minutes) = image(
  % face and outer ring
  fill fullcircle scaled 100 withcolor 1/256(240, 240, 230);
  draw fullcircle scaled  99 withcolor .8 white;
  draw fullcircle scaled 100 withpen pencircle scaled 7/8;
  % hour and minute marks
  for t=0 step  6 until 359: 
    draw ((48,0)--(49,0)) rotated t; 
  endfor
  for t=0 step 30 until 359: 
    draw ((47,0)--(49,0)) rotated t withpen pencircle scaled 7/8; 
  endfor
  % numerals
  for h=1 upto 12:
    label(
      if known roman_numerals_please: 
         clock_roman h infont "bchr8r" rotated ((12-h)*30)
      else: 
         decimal h infont "bchr8r" 
      fi, (40,0) rotated htod(h)); 
  endfor
  % hands rotated to the given time
  filldraw hand1 rotated htod(hours+minutes/60) withpen pencircle scaled 7/8;
  filldraw hand2 rotated mtod(minutes)          withpen pencircle scaled 7/8;
  % draw the center on top
  fill fullcircle scaled 5;
  fill fullcircle scaled 3 withcolor .4 white;
) enddef;
