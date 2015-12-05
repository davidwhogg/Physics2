u= 1.00cm ;
wire_pen_weight=    0.02u ;
element_pen_weight= 0.04u ;
capacitor_height= 0.08u ;
capacitor_width= 5*capacitor_height ;
resistor_width= 0.1u ;
resistor_length= 6*resistor_width ;
inductor_width= 0.15u ;
inductor_length= 5*inductor_width ;
switch_length= 0.3u ;
ac_generator_radius= 0.20u ;
path nada ;
nada= (0,0)..cycle ;
picture voltage,capacitor,resistor,inductor,switch,ac_generator ;

% define capacitor
pickup pencircle scaled element_pen_weight ;
draw (0,capacitor_height/2)--(0,-capacitor_height/2) withcolor white ;
draw (-capacitor_width/2, capacitor_height/2)
--(capacitor_width/2, capacitor_height/2) ;
draw (-capacitor_width/2,-capacitor_height/2)
--(capacitor_width/2,-capacitor_height/2) ;
capacitor = currentpicture ;
clip currentpicture to nada ;

% define DC voltage source (similar to capacitor)
pickup pencircle scaled element_pen_weight ;
draw (0,capacitor_height/2)--(0,-capacitor_height/2) withcolor white ;
draw (-3*resistor_width, capacitor_height/2)
--(3*resistor_width, capacitor_height/2) ;
draw (-1.5*resistor_width,-capacitor_height/2)
--(1.5*resistor_width,-capacitor_height/2) ;
voltage = currentpicture ;
clip currentpicture to nada ;

% define resistor
pickup pencircle scaled element_pen_weight ;
draw (0,resistor_length/2)--(0,-resistor_length/2) withcolor white ;
draw (0,resistor_length/2)
--( resistor_width/2, 5*resistor_length/12)
--(-resistor_width/2, 3*resistor_length/12)
--( resistor_width/2,   resistor_length/12)
--(-resistor_width/2,  -resistor_length/12)
--( resistor_width/2,-3*resistor_length/12)
--(-resistor_width/2,-5*resistor_length/12)
--(0,-resistor_length/2) ;
resistor= currentpicture ;
clip currentpicture to nada ;  

% define inductor
pickup pencircle scaled element_pen_weight ;
draw (0,inductor_length/2)--(0,-inductor_length/2) withcolor white ;
draw (0,inductor_length/2)
..{down}(inductor_width, 3*inductor_length/8)
..{up}(               0, 2*inductor_length/8)
..{down}(inductor_width,  inductor_length/8)
..{up}(               0,  0)
..{down}(inductor_width, -inductor_length/8)
..{up}(               0,-2*inductor_length/8)
..{down}(inductor_width,-3*inductor_length/8)
..(0,-inductor_length/2) ;
inductor= currentpicture ;
clip currentpicture to nada ;  

% define switch
pickup pencircle scaled element_pen_weight ;
draw (0,switch_length/2)--(0,-switch_length/2) withcolor white ;
draw (0,switch_length/2) ;
draw (0,-switch_length/2) ;
draw (0,switch_length) rotated 45 shifted (0,-switch_length/2) ;
pickup pencircle scaled wire_pen_weight ;
draw ((0,0)--(0,switch_length)) rotated 45 shifted (0,-switch_length/2) ;
switch= currentpicture ;
clip currentpicture to nada ;

% define AC voltage source
pickup pencircle scaled element_pen_weight ;
draw (0,ac_generator_radius)--(0,-ac_generator_radius) withcolor white ;
draw (0,ac_generator_radius)..(-ac_generator_radius,0)
..(0,-ac_generator_radius)..(ac_generator_radius,0)..cycle ;
draw (-0.5*ac_generator_radius,0){dir -45}
..{dir -45}(0.5*ac_generator_radius,0) ;
ac_generator= currentpicture ;
clip currentpicture to nada ;

beginfig(1) ;
  pickup pencircle scaled wire_pen_weight ;
  draw (0,-u)--(0,u)--(4u,u)--(4u,-u)--cycle ;
  draw (2u,-u)--(2u,u) ;
  draw voltage shifted (0,0) ;
  label.lft(btex 1.5 V etex, (0-3*resistor_width,0) ) ;
  draw resistor rotated 90 shifted (u,u) ;
  label.bot(btex 75 $\Omega$ etex, (u,u-resistor_width/2) ) ;
  draw resistor rotated 90 shifted (3u,-u) ;
  label.top(btex 75 $\Omega$ etex, (3u,-u+resistor_width/2) ) ;
  draw resistor shifted (2u,0) ;
  label.lft(btex 75 $\Omega$ etex, (2u-resistor_width/2,0) ) ;
  draw capacitor shifted (4u,0) ;
  label.lft(btex 1.5 $\mu$F etex, (4u-2*resistor_width,0) ) ;
endfig ;

beginfig(2) ;
  pickup pencircle scaled wire_pen_weight ;
  draw (0,-u)--(0,u)--(4u,u)--(4u,-u)--cycle ;
  draw (2u,-u)--(2u,u) ;
  draw voltage shifted (0,0) ;
  label.lft(btex 1.5 V etex, (0-3*resistor_width,0) ) ;
  draw resistor rotated 90 shifted (u,u) ;
  label.bot(btex 75 $\Omega$ etex, (u,u-resistor_width/2) ) ;
  draw switch rotated -90 shifted (u,-u) ;
  draw resistor rotated 90 shifted (3u,-u) ;
  label.top(btex 75 $\Omega$ etex, (3u,-u+resistor_width/2) ) ;
  draw resistor shifted (2u,0) ;
  label.lft(btex 75 $\Omega$ etex, (2u-resistor_width/2,0) ) ;
  draw inductor shifted (4u,0) ;
  label.lft(btex 1.5 H etex, (4u,0) ) ;
endfig ;

beginfig(3) ;
  pickup pencircle scaled wire_pen_weight ;
  draw (0,-u)--(0,u)--(3u,u)--(3u,-u)--cycle ;
  draw (2u,-u)--(2u,u) ;
  draw ac_generator shifted (0,0) ;
  label.lft(btex $\cal E$, $\omega$ etex, (0-ac_generator_radius,0) ) ;
  draw resistor rotated 90 shifted (u,u) ;
  label.bot(btex $R$ etex, (u,u-resistor_width/2) ) ;
  draw capacitor shifted (2u,0) ;
  label.lft(btex $C$ etex, (2u-capacitor_width/2,0) ) ;
  draw inductor shifted (3u,0) ;
  label.lft(btex $L$ etex, (3u,0) ) ;
endfig ;

beginfig(4) ;
  pickup pencircle scaled wire_pen_weight ;
  draw (0,-u)--(0,u)--(2u,u)--(2u,-u)--cycle ;
  draw capacitor shifted (0,0) ;
  label.lft(btex $C$ etex, (0-ac_generator_radius,0) ) ;
  draw resistor rotated 90 shifted (u,-u) ;
  label.top(btex $R$ etex, (u,-u+resistor_width/2) ) ;
  draw inductor shifted (2u,0) ;
  label.lft(btex $L$ etex, (2u,0) ) ;
  draw switch rotated 90 shifted (u,u) ;
endfig ;

beginfig(5) ;
  pickup pencircle scaled wire_pen_weight ;
  draw (0,-u)--(0,u)--(2u,u)--(2u,-u)--cycle ;
  draw (2u,u)--(4u,u)--(4u,-u)--(2u,-u) ;
  draw voltage shifted (0,0) ;
  label.lft(btex $V$ etex, (0-capacitor_width/2,0) ) ;
  draw switch rotated -90 shifted (u,u) ;
  draw resistor rotated 90 shifted (u,-u) ;
  label.top(btex $R_1$ etex, (u,-u+resistor_width/2) ) ;
  draw inductor shifted (2u,0) ;
  label.lft(btex $L$ etex, (2u,0) ) ;
  draw resistor shifted (4u,0) ;
  label.lft(btex $R_2$ etex, (4u+resistor_width/2,0) ) ;
endfig ;

beginfig(6) ;
  pickup pencircle scaled wire_pen_weight ;
  draw (0,-u)--(0,u)--(2u,u)--(2u,-u)--cycle ;
  draw capacitor shifted (2u,u/2) ;
  label.rt(btex $C_1$ etex, (2u+capacitor_width/2,u/2) ) ;
  draw capacitor shifted (2u,-u/2) ;
  label.rt(btex $C_2$ etex, (2u+capacitor_width/2,-u/2) ) ;
  draw resistor rotated 90 shifted (u,u) ;
  label.bot(btex $R$ etex, (u,u-resistor_width/2) ) ;
  draw inductor rotated 90 shifted (u,-u) ;
  label.top(btex $L$ etex, (u,-u+inductor_width) ) ;
  draw ac_generator ;
  label.lft(btex ${\cal E}_0,\omega$ etex, (0-ac_generator_radius,0) ) ;
endfig ;

end
