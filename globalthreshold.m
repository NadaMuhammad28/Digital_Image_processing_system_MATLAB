function g=globalthreshold(f)

T=0.5 *(min(f(:))+max(f(:)));   % initial value
%T=0;
done=false;

  while ~done
      g1= f(find(f>=T));
      g2= f(find(f<T));    
    Tnext=0.5*(mean(g1)+mean(g2));
    
    done=(abs(T-Tnext)<0.5);
      T=Tnext;
  end
  
  g=(f>=T);
end


