vardef signr suffix $ = 
   if $<0: - else: + fi uniformdeviate 1 
   enddef;
vardef walkr suffix $ = 
   $ := $ if uniformdeviate 1 < (2**-abs($)): + else: - fi signr $; 
   $ 
   enddef;
