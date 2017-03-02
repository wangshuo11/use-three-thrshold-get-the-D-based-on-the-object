%����cell�ľ����ʾ����� SEmin��Min intensity SE����SEmax��Max intensity SE����SEavg��Avg intensity SE����
%SEd��Dilation SE����SEr��Rotation SE����SEt��Translation SE����RSE��Residual SE����D��Cell penalty��
function [SEmin,SEmax,SEavg,SEd,SEr,SEt,RSE,D]=f_res(Zjk,Zj,Cavg_Zjk,Cavg_Zj,Cmin_Zjk,Cmin_Zj,Cmax_Zjk,Cmax_Zj)

%  Zjk_avg��Zj_avg ��Ӧ 2007�����Ĺ�ʽ��9��
length_Zjk=length(Zjk);
length_Zj=length(Zj);
Zjk_avg=mean(Zjk)*(length_Zjk/(length_Zjk-1))*ones(length_Zjk,1);
Zj_avg=mean(Zj)*(length_Zj/(length_Zj-1))*ones(length_Zj,1);

%����Zjc��Zjkc��2007�����Ĺ�ʽ(9)�ͣ�10���м��Ƕ�è����
Zjkc=Zjk-Zjk_avg;
Zjc=Zj-Zj_avg;
%����Rjk��FFjk��Bjk��B0jk(2007�����Ĺ�ʽ(8))��ZZj(2007�����Ĺ�ʽ(7))
Rjk=f_rjk(Zjkc,Zjc);    
FFjk=f_FFjk(Zjkc,Zjc);
Bjk=f_Bjk(Zjk_avg,Zj_avg,Rjk,FFjk);
B0jk=f_b0jk(Zjk,Zj,Rjk,FFjk);
ZZj=f_ZZj(Bjk,Rjk,FFjk,Zjk);
 
%����SEd��SEr��SEt��RSE  ��Ӧ�����й�ʽ��13��
SEmin=(Cmin_Zj-Cmin_Zjk)*(Cmin_Zj-Cmin_Zjk);
SEmax=(Cmax_Zj-Cmax_Zjk)*(Cmax_Zj-Cmax_Zjk);
SEavg=(Cavg_Zj-Cavg_Zjk)*(Cavg_Zj-Cavg_Zjk);

%����SEmin��SEmax��SEavg��SEd��SEr��SEt��RSE  ��Ӧ�����й�ʽ��14��
SEd=Rjk*Rjk;
SEr=FFjk*FFjk;
SEt=abs(B0jk*B0jk);
%RSS����RSE��Ӧ��2007�����й�ʽ��10��
RSE=f_RSS(ZZj,Zj);      

%����D,Ȩ�ذ��չ�ʽ������(w1,w2,w3,w4,w5,w6,w7)  ��Ӧ2010�����й�ʽ��3��
w1=0.2;
w2=0.2;
w3=0.2;
w4=0.2;
w5=0.1;
w6=0.05;
w7=0.05;
D=w1*sqrt(RSE)+w2*(SEavg)+w3*(SEmin)+w4*(SEmax)+abs(w5*100*(1-SEd))+w6*100*SEr+w7*sqrt(SEt);     
end