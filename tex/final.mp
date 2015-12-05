u= 1.00in;
axis_wt:= 0.5pt;
line_wt:= 3axis_wt;

beginfig(1);
  pickup pencircle scaled axis_wt;
  drawarrow (-2.5u,0)..(2.5u,0);
  label.rt(btex $x$ etex, (2.5u,0) ) ;
  drawarrow (0,-2.5u)..(0,2.5u);
  label.top(btex $y$ etex, (0,2.5u) ) ;
  z1= (0,0.5u);
  pickup pencircle scaled line_wt;
  draw z1--(z1 rotated 120)--(z1 rotated 240)--cycle;
endfig;

beginfig(2);
  pickup pencircle scaled axis_wt;
  drawarrow (-2.5u,0)..(2.5u,0);
  label.rt(btex $x$ etex, (2.5u,0));
  drawarrow (0,-2.5u)..(0,2.5u);
  label.top(btex $y$ etex, (0,2.5u));
  pickup pencircle scaled line_wt;
  draw fullcircle scaled 0.2u shifted (u,0);
  draw fullcircle scaled 0.2u shifted (-u,0);
  draw ((-0.1u,0)..(0.1u,0)) rotated 45 shifted (-u,0);
  draw ((-0.1u,0)..(0.1u,0)) rotated -45 shifted (-u,0);
  pickup pencircle scaled 3line_wt;
  draw (u,0);
endfig;

beginfig(3);
  pickup pencircle scaled line_wt;
  draw fullcircle scaled 2u;
  draw (0,0);
  draw (0.7u,0) rotated -45;
  label.rt(btex $P$ etex, ((0.7u,0) rotated -45));
  pickup pencircle scaled axis_wt;
  drawarrow ((0,0)..(u,0)) rotated 45;
  label.ulft(btex $a$ etex, ((0.5u,0) rotated 45));
  drawarrow ((0,0)..(0.7u,0)) rotated -45;
  label.urt(btex $r$ etex, ((0.35u,0) rotated -45));
  drawarrow (0,0.3u)..(-0.3u,0)..(0,-0.3u);
  label.lft(btex $\omega$ etex, (-0.3u,0));
  draw ((-0.1u,0)..(0.1u,0)) rotated 45 shifted (0.9u,0.9u);
  draw ((-0.1u,0)..(0.1u,0)) rotated -45 shifted (0.9u,0.9u);
  label.rt(btex $B$ etex, (0.95u,0.9u));
endfig;

end
