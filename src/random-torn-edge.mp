vardef walkr suffix $ = 
  save t; boolean t; 
  t = uniformdeviate 1 < (2 ** - abs($));
  $ := $ if t: + else: - fi signr $; $ 
enddef;
vardef signr suffix $ = 
  if $ < 0: - else: + fi uniformdeviate 1 
enddef;
