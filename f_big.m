%��truth ��cells��Ŀ����forest��cells��Ŀ��ʹ��f_small������������[SEmin,SEmax,SEavg,SEd,SEr,SEt,RSE,D]
%����������ÿ��truth��cell����Ҫƥ���ԭ�򣬽�truth��cells�ֽ�Ϊ���ڵģ�f_equal()����С�ڵ����ȥ�����f_small()��;
%���ʱ������forecast��cells����η��ʣ�
function  [SEmin,SEmax,SEavg,SEd,SEr,SEt,RSE,D]=f_big(Zjk,Zj,Zjk_intensity,Zj_intensity)

     [aj,bj]=size(Zj);
     [ajk,bjk]=size(Zjk);
     T_res=zeros(1,8);
     k=fix(bj/bjk);
     m=mod(bj,bjk);
                 %k��ʾtruth��cells����Ŀ��forcast��cells��Ŀ��k����m��ʾ���������ǿ���ʹ��k��f_equal()��1��f_small()���
     for i=0:k-1
         t_Zj=Zj(:,bjk*i+1:(i+1)*bjk);
         t_Zj_intensity=Zj_intensity(:,bjk*i+1:(i+1)*bjk);
                                                         %f_bigtoequal()����������������¸��������ۼ�
         [SEmin,SEmax,SEavg,SEd,SEr,SEt,RSE,D]=f_bigtoequal(Zjk,t_Zj,Zjk_intensity,t_Zj_intensity); 
         T_res(1,1)=T_res(1,1)+ SEmin;
         T_res(1,2)=T_res(1,2)+ SEmax;
         T_res(1,3)=T_res(1,3)+ SEavg;
         T_res(1,4)=T_res(1,4)+SEd;
         T_res(1,5)=T_res(1,5)+ SEr;
         T_res(1,6)=T_res(1,6)+ SEt;
         T_res(1,7)=T_res(1,7)+RSE;
         T_res(1,8)=T_res(1,8)+D;
     end        
     if(m>0)                       %f_bigtoequal()����������������¸��������ۼ�
         t_Zj=Zj(:,(k*bjk+1):bj);
         t_Zj_intensity=Zj_intensity(:,(bjk*k+1):bj);
         [SEmin,SEmax,SEavg,SEd,SEr,SEt,RSE,D]=f_bigtoequal(Zjk,t_Zj,Zjk_intensity,t_Zj_intensity);
         T_res(1,1)=T_res(1,1)+ SEmin;
         T_res(1,2)=T_res(1,2)+ SEmax;
         T_res(1,3)=T_res(1,3)+ SEavg;
         T_res(1,4)=T_res(1,4)+SEd;
         T_res(1,5)=T_res(1,5)+ SEr;
         T_res(1,6)=T_res(1,6)+ SEt;
         T_res(1,7)=T_res(1,7)+RSE;
         T_res(1,8)=T_res(1,8)+D;
     end
                     % %���չ�ʽSEd,SEt,SErȡ��ֵ
     SEd=T_res(1,4)/bj;
     SEr=T_res(1,5)/bj;
     SEt=T_res(1,6)/bj;
 end