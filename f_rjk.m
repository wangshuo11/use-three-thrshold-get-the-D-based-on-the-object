function Rjk=f_rjk(Zjkc,Zjc)
t1=(Zjkc)'*Zjc;
t2=(Zjkc)'*Zjkc;
t3=abs(t1);
Rjk=t3/t2;
end