
function h= linesdetect1(f)

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

[m,n]=size(f);
h=zeros(m,n);
    
 for i=1:m
    for j=1:n        
       if(g1(i,j)> g2(i,j) && g1(i,j)> g3(i,j) && g1(i,j)> g4(i,j))
          h(i,j)=g1(i,j);         
        
       elseif(g2(i,j)> g1(i,j)&& g2(i,j)> g3(i,j)&&g2(i,j)> g4(i,j))
         h(i,j)=g2(i,j);           
       
       elseif(g3(i,j)> g1(i,j)&& g3(i,j)> g2(i,j)&&g3(i,j)> g4(i,j))
          h(i,j)=g3(i,j);           
       
       elseif(g4(i,j)> g1(i,j)&& g4(i,j)> g2(i,j)&&g4(i,j)> g3(i,j))
         h(i,j)=g4(i,j);          
       end       
    end
 end
 
end

