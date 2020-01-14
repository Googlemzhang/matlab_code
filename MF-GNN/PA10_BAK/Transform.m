function [T01,T12,T23,T34,T45,T56,T67]=Transform(q)

global len;

c(1)=cos(q(1));
s(1)=sin(q(1));
c(2)=cos(q(2));
s(2)=sin(q(2));
c(3)=cos(q(3));
s(3)=sin(q(3));
c(4)=cos(q(4));
s(4)=sin(q(4));
c(5)=cos(q(5));
s(5)=sin(q(5));
c(6)=cos(q(6));
s(6)=sin(q(6));
c(7)=cos(q(7));
s(7)=sin(q(7));

T01=[c(1) -s(1) 0 0; s(1) c(1) 0 0; 0 0 1 0; 0 0 0 1];
T12=[c(2) -s(2) 0 0; 0 0 1 0; -s(2) -c(2) 0 0; 0 0 0 1];
T23=[c(3) -s(3) 0 0; 0 0 -1 -len(1); s(3) c(3) 0 0; 0 0 0 1];
T34=[c(4) -s(4) 0 0; 0 0 1 0; -s(4) -c(4) 0 0; 0 0 0 1];
T45=[c(5) -s(5) 0 0; 0 0 -1 -len(2); s(5) c(5) 0 0; 0 0 0 1];
T56=[c(6) -s(6) 0 0; 0 0 1 0; -s(6) -c(6) 0 0; 0 0 0 1];
T67=[c(7) -s(7) 0 0; 0 0 -1 -len(3); s(7) c(7) 0 0; 0 0 0 1];