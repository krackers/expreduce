solveQuadratic[a_, b_, c_, x_] := {{x->(-b-Sqrt[b^2-4 a c])/(2 a)},{x->(-b+Sqrt[b^2-4 a c])/(2 a)}};
solveCubic[d_,c_,b_,a_,x_] := {{x->-(c/(3 d))-(2^(1/3) (-c^2+3 b d))/(3 d (-2 c^3+9 b c d-27 a d^2+Sqrt[4 (-c^2+3 b d)^3+(-2 c^3+9 b c d-27 a d^2)^2])^(1/3))+(-2 c^3+9 b c d-27 a d^2+Sqrt[4 (-c^2+3 b d)^3+(-2 c^3+9 b c d-27 a d^2)^2])^(1/3)/(3 2^(1/3) d)},{x->-(c/(3 d))+((1+I Sqrt[3]) (-c^2+3 b d))/(3 2^(2/3) d (-2 c^3+9 b c d-27 a d^2+Sqrt[4 (-c^2+3 b d)^3+(-2 c^3+9 b c d-27 a d^2)^2])^(1/3))-(1/(6 2^(1/3) d))(1-I Sqrt[3]) (-2 c^3+9 b c d-27 a d^2+Sqrt[4 (-c^2+3 b d)^3+(-2 c^3+9 b c d-27 a d^2)^2])^(1/3)},{x->-(c/(3 d))+((1-I Sqrt[3]) (-c^2+3 b d))/(3 2^(2/3) d (-2 c^3+9 b c d-27 a d^2+Sqrt[4 (-c^2+3 b d)^3+(-2 c^3+9 b c d-27 a d^2)^2])^(1/3))-(1/(6 2^(1/3) d))(1+I Sqrt[3]) (-2 c^3+9 b c d-27 a d^2+Sqrt[4 (-c^2+3 b d)^3+(-2 c^3+9 b c d-27 a d^2)^2])^(1/3)}};
solveQuartic[e_.*x_^4 + d_.*x_^3 + c_.*x_^2 + b_.*x_ + a_., x_] := {{x->-(d/(4 e))-1/2 \[Sqrt](d^2/(4 e^2)-(2 c)/(3 e)+(2^(1/3) (c^2-3 b d+12 a e))/(3 e (2 c^3-9 b c d+27 a d^2+27 b^2 e-72 a c e+Sqrt[-4 (c^2-3 b d+12 a e)^3+(2 c^3-9 b c d+27 a d^2+27 b^2 e-72 a c e)^2])^(1/3))+(1/(3 2^(1/3) e))((2 c^3-9 b c d+27 a d^2+27 b^2 e-72 a c e+Sqrt[-4 (c^2-3 b d+12 a e)^3+(2 c^3-9 b c d+27 a d^2+27 b^2 e-72 a c e)^2])^(1/3)))-1/2 \[Sqrt](d^2/(2 e^2)-(4 c)/(3 e)-(2^(1/3) (c^2-3 b d+12 a e))/(3 e (2 c^3-9 b c d+27 a d^2+27 b^2 e-72 a c e+Sqrt[-4 (c^2-3 b d+12 a e)^3+(2 c^3-9 b c d+27 a d^2+27 b^2 e-72 a c e)^2])^(1/3))-(1/(3 2^(1/3) e))((2 c^3-9 b c d+27 a d^2+27 b^2 e-72 a c e+Sqrt[-4 (c^2-3 b d+12 a e)^3+(2 c^3-9 b c d+27 a d^2+27 b^2 e-72 a c e)^2])^(1/3))-(-(d^3/e^3)+(4 c d)/e^2-(8 b)/e)/(4 \[Sqrt](d^2/(4 e^2)-(2 c)/(3 e)+(2^(1/3) (c^2-3 b d+12 a e))/(3 e (2 c^3-9 b c d+27 a d^2+27 b^2 e-72 a c e+\[Sqrt](-4 (c^2-3 b d+12 a e)^3+(2 c^3-9 b c d+27 a d^2+27 b^2 e-72 a c e)^2))^(1/3))+(1/(3 2^(1/3) e))((2 c^3-9 b c d+27 a d^2+27 b^2 e-72 a c e+\[Sqrt](-4 (c^2-3 b d+12 a e)^3+(2 c^3-9 b c d+27 a d^2+27 b^2 e-72 a c e)^2))^(1/3)))))},{x->-(d/(4 e))-1/2 \[Sqrt](d^2/(4 e^2)-(2 c)/(3 e)+(2^(1/3) (c^2-3 b d+12 a e))/(3 e (2 c^3-9 b c d+27 a d^2+27 b^2 e-72 a c e+Sqrt[-4 (c^2-3 b d+12 a e)^3+(2 c^3-9 b c d+27 a d^2+27 b^2 e-72 a c e)^2])^(1/3))+(1/(3 2^(1/3) e))((2 c^3-9 b c d+27 a d^2+27 b^2 e-72 a c e+Sqrt[-4 (c^2-3 b d+12 a e)^3+(2 c^3-9 b c d+27 a d^2+27 b^2 e-72 a c e)^2])^(1/3)))+1/2 \[Sqrt](d^2/(2 e^2)-(4 c)/(3 e)-(2^(1/3) (c^2-3 b d+12 a e))/(3 e (2 c^3-9 b c d+27 a d^2+27 b^2 e-72 a c e+Sqrt[-4 (c^2-3 b d+12 a e)^3+(2 c^3-9 b c d+27 a d^2+27 b^2 e-72 a c e)^2])^(1/3))-(1/(3 2^(1/3) e))((2 c^3-9 b c d+27 a d^2+27 b^2 e-72 a c e+Sqrt[-4 (c^2-3 b d+12 a e)^3+(2 c^3-9 b c d+27 a d^2+27 b^2 e-72 a c e)^2])^(1/3))-(-(d^3/e^3)+(4 c d)/e^2-(8 b)/e)/(4 \[Sqrt](d^2/(4 e^2)-(2 c)/(3 e)+(2^(1/3) (c^2-3 b d+12 a e))/(3 e (2 c^3-9 b c d+27 a d^2+27 b^2 e-72 a c e+\[Sqrt](-4 (c^2-3 b d+12 a e)^3+(2 c^3-9 b c d+27 a d^2+27 b^2 e-72 a c e)^2))^(1/3))+(1/(3 2^(1/3) e))((2 c^3-9 b c d+27 a d^2+27 b^2 e-72 a c e+\[Sqrt](-4 (c^2-3 b d+12 a e)^3+(2 c^3-9 b c d+27 a d^2+27 b^2 e-72 a c e)^2))^(1/3)))))},{x->-(d/(4 e))+1/2 \[Sqrt](d^2/(4 e^2)-(2 c)/(3 e)+(2^(1/3) (c^2-3 b d+12 a e))/(3 e (2 c^3-9 b c d+27 a d^2+27 b^2 e-72 a c e+Sqrt[-4 (c^2-3 b d+12 a e)^3+(2 c^3-9 b c d+27 a d^2+27 b^2 e-72 a c e)^2])^(1/3))+(1/(3 2^(1/3) e))((2 c^3-9 b c d+27 a d^2+27 b^2 e-72 a c e+Sqrt[-4 (c^2-3 b d+12 a e)^3+(2 c^3-9 b c d+27 a d^2+27 b^2 e-72 a c e)^2])^(1/3)))-1/2 \[Sqrt](d^2/(2 e^2)-(4 c)/(3 e)-(2^(1/3) (c^2-3 b d+12 a e))/(3 e (2 c^3-9 b c d+27 a d^2+27 b^2 e-72 a c e+Sqrt[-4 (c^2-3 b d+12 a e)^3+(2 c^3-9 b c d+27 a d^2+27 b^2 e-72 a c e)^2])^(1/3))-(1/(3 2^(1/3) e))((2 c^3-9 b c d+27 a d^2+27 b^2 e-72 a c e+Sqrt[-4 (c^2-3 b d+12 a e)^3+(2 c^3-9 b c d+27 a d^2+27 b^2 e-72 a c e)^2])^(1/3))+(-(d^3/e^3)+(4 c d)/e^2-(8 b)/e)/(4 \[Sqrt](d^2/(4 e^2)-(2 c)/(3 e)+(2^(1/3) (c^2-3 b d+12 a e))/(3 e (2 c^3-9 b c d+27 a d^2+27 b^2 e-72 a c e+\[Sqrt](-4 (c^2-3 b d+12 a e)^3+(2 c^3-9 b c d+27 a d^2+27 b^2 e-72 a c e)^2))^(1/3))+(1/(3 2^(1/3) e))((2 c^3-9 b c d+27 a d^2+27 b^2 e-72 a c e+\[Sqrt](-4 (c^2-3 b d+12 a e)^3+(2 c^3-9 b c d+27 a d^2+27 b^2 e-72 a c e)^2))^(1/3)))))},{x->-(d/(4 e))+1/2 \[Sqrt](d^2/(4 e^2)-(2 c)/(3 e)+(2^(1/3) (c^2-3 b d+12 a e))/(3 e (2 c^3-9 b c d+27 a d^2+27 b^2 e-72 a c e+Sqrt[-4 (c^2-3 b d+12 a e)^3+(2 c^3-9 b c d+27 a d^2+27 b^2 e-72 a c e)^2])^(1/3))+(1/(3 2^(1/3) e))((2 c^3-9 b c d+27 a d^2+27 b^2 e-72 a c e+Sqrt[-4 (c^2-3 b d+12 a e)^3+(2 c^3-9 b c d+27 a d^2+27 b^2 e-72 a c e)^2])^(1/3)))+1/2 \[Sqrt](d^2/(2 e^2)-(4 c)/(3 e)-(2^(1/3) (c^2-3 b d+12 a e))/(3 e (2 c^3-9 b c d+27 a d^2+27 b^2 e-72 a c e+Sqrt[-4 (c^2-3 b d+12 a e)^3+(2 c^3-9 b c d+27 a d^2+27 b^2 e-72 a c e)^2])^(1/3))-(1/(3 2^(1/3) e))((2 c^3-9 b c d+27 a d^2+27 b^2 e-72 a c e+Sqrt[-4 (c^2-3 b d+12 a e)^3+(2 c^3-9 b c d+27 a d^2+27 b^2 e-72 a c e)^2])^(1/3))+(-(d^3/e^3)+(4 c d)/e^2-(8 b)/e)/(4 \[Sqrt](d^2/(4 e^2)-(2 c)/(3 e)+(2^(1/3) (c^2-3 b d+12 a e))/(3 e (2 c^3-9 b c d+27 a d^2+27 b^2 e-72 a c e+\[Sqrt](-4 (c^2-3 b d+12 a e)^3+(2 c^3-9 b c d+27 a d^2+27 b^2 e-72 a c e)^2))^(1/3))+(1/(3 2^(1/3) e))((2 c^3-9 b c d+27 a d^2+27 b^2 e-72 a c e+\[Sqrt](-4 (c^2-3 b d+12 a e)^3+(2 c^3-9 b c d+27 a d^2+27 b^2 e-72 a c e)^2))^(1/3)))))}}/;FreeQ[{a,b,c,d,e},x];
