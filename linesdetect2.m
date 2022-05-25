
function g= linesdetect2(f)

w1=[-1 2 -1; -1 2 -1 ; -1 2 -1];
g1=imfilter(f,w1);
g1(g1<0)=0;   % neglecting negative values

w2=[-1 -1 -1; 2 2 2 ; -1 -1 -1];
g2=imfilter(f,w2);
g2(g2<0)=0;    % neglecting negative values

w3=[-1 -1 2; -1 2 -1 ; 2 -1 -1];
g3=imfilter(f,w3);
g3(g3<0)=0;     % neglecting negative values

w4=[2 -1 -1; -1 2 -1 ; -1 -1 2];
g4=imfilter(f,w4);
g4(g4<0)=0;      % neglecting negative values

 g=g1+g2+g3+g4;
 
 
 
 
