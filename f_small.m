%��truth ��cells��Ŀ����forest��cells��Ŀ��ʹ��f_small������������[SEmin,SEmax,SEavg,SEd,SEr,SEt,RSE,D]
function [SEmin,SEmax,SEavg,SEd,SEr,SEt,RSE,D]=f_small(Zjk,Zj,Zjk_intensity,Zj_intensity)
        [a,b]=size(Zj);           
                     %Zjk��ÿһ�д洢��һ��cells��������Ϣ����˾���Zj������b����cells����Ŀ
        [ajk,bjk]=size(Zjk);       
                        %Tres()�����ۼ�truth�ĵ�i��cell��forecast�ĵ�i��cell�����
        T_res=zeros(1,8);          
                      %�������forecast��cellsƥ�����
        visit=zeros(bjk,1);
        for i=1:b
            Cx=Zj_intensity(1,i);
            Cy=Zj_intensity(2,i);
          loc=f_equal_close(Cx,Cy,Zjk_intensity,visit,bjk);
           %�ҳ�λ��Ϊloc��δ���ʵľ���truth�ĵ�i��cell������(Cx,Cy)�����forecst��cell ����match
          t_Zj=Zj(:,i);
          t_Zjk=Zjk(:,loc);
          Cmin_Zj=Zj_intensity(3,i);
          Cmax_Zj=Zj_intensity(4,i);
          Cavg_Zj=Zj_intensity(5,i);
          Cmin_Zjk=Zjk_intensity(3,loc);
          Cmax_Zjk=Zjk_intensity(4,loc);
          Cavg_Zjk=Zjk_intensity(5,loc);
          [SEmin,SEmax,SEavg,SEd,SEr,SEt,RSE,D]=f_res(t_Zjk,t_Zj,Cavg_Zjk,Cavg_Zj,Cmin_Zjk,Cmin_Zj,Cmax_Zjk,Cmax_Zj);
             %f_res()�����ÿ������cell�ĸ������
          T_res(1,1)=T_res(1,1)+SEmin;
          T_res(1,2)=T_res(1,2)+SEmax;
          T_res(1,3)=T_res(1,3)+SEavg;
          T_res(1,4)=T_res(1,4)+SEd;
          T_res(1,5)=T_res(1,5)+SEr;
          T_res(1,6)=T_res(1,6)+SEt;
          T_res(1,7)=T_res(1,7)+RSE;
          T_res(1,8)=T_res(1,8)+D;
        end
       SEmin=T_res(1,1);
       SEmax=T_res(1,2);
       SEavg=T_res(1,3);
                    %���չ�ʽSEd,SEt,SErȡ��ֵ
       SEd=T_res(1,4)/b;
       SEr=T_res(1,5)/b;
       SEt=T_res(1,6)/b;
       RSE= T_res(1,7);
       D=T_res(1,8);
  end