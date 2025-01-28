newinternal thatch_angle;
newinternal thatch_space;
thatch_angle := 45;
thatch_space := 4;
%def drawarrow expr p = _apth:=p; _finarr enddef;
def thatch expr p = _apth:=p; _thatch enddef;
def _thatch text t =
    d_ := 2 abs (urcorner _apth - llcorner _apth);
    draw begingroup; save T; picture T; T = image(
        for y=-d_ step thatch_space until d_:
            draw (left--right) scaled d_ shifted (0, y) t;
        endfor) rotated thatch_angle shifted center _apth;
        clip T to _apth;
        T endgroup
enddef;
