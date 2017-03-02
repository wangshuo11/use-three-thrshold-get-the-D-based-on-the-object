%[flag,SEmin,SEmax,SEavg,SEd,SEr,SEt,RSE,D]���������ļ�file_truth,file_forecast,�ֱ���������
%EXAMPLE:
%    [flag,SEmin,SEmax,SEavg,SEd,SEr,SEt,RSE,D]=f_verification('3.dat','1.dat')
function [flag,SEmin,SEmax,SEavg,SEd,SEr,SEt,RSE,D]=f_verification(file_truth,file_forecast,threshold_area,threshold_rainfall,threshold_lunkuo)
 
%f_cells()�����ã�ʶ��������������Ҽ����ÿ��������������Ϣ��Cx��Cy,Cmin,Cmax,Cavg����
%������ʾZj=(X0+sin(angle)*Y*i....)
 %��׺Ϊjk�ı�ʾ����forecast����Ϣ����׺��j�ı�ʾtruth����Ϣ
%Zj��ÿһ�б�ʾtruth��ÿ��cell��vector informations��
%Zjk�����ÿһ�б�ʾforecast��ÿ��cell��vector
%Zj_intensity������ÿһ�б�ʾtruth��ÿ�����������ģ�Cx��Cy���ͽ���ǿ�ȣ�Cmin,Cmax,Cavg��;
%Zjk_intensity������ÿһ�б�ʾforecast��ÿ�����������ģ�Cx��Cy���ͽ���ǿ�ȣ�Cmin,Cmax,Cavg��;
%Zjk��Zjk_intesityͬһ�б�ʾforecastͬһ����������Ϣ��
%Zj��Zj_intesityͬһ�б�ʾtruthͬһ����������Ϣ��

[Zj,Zj_intensity]=f_new_cells(file_truth,threshold_area,threshold_rainfall,threshold_lunkuo);                                  
[Zjk,Zjk_intensity]=f_new_cells(file_forecast,threshold_area,threshold_rainfall,threshold_lunkuo);  

%�������Ĵ�С������Ŀ����image��celss��������Zjkb��ʾforecast��cells������Zj��ʾruth��cells������
[Zjka,Zjkb]=size(Zjk);
[Zja,Zjb]=size(Zj);
     
%����truth��cells��forecast ��cells�Ĳ�ֵ����Ϊ�����������
    if(Zjkb==0||Zjb==0)
        disp('Ԥ��������أ�');
        %û����������֤����
        flag=-1;
        SEmin=-1;
        SEmax=-1;
        SEavg=-1;
        SEd=-1;
        SEr=-1;
        SEt=-1;
        RSE=-1;
        D=-1;
    elseif(Zjkb==Zjb) %truth ��cells����forecast��cellsʱ
        [SEmin,SEmax,SEavg,SEd,SEr,SEt,RSE,D]=f_equal(Zjk,Zj,Zjk_intensity,Zj_intensity);  
        flag=0;%����(Zjkb>Zjb)flag��ʾfalse,(Zjkb==Zjb)flag��ʾhit��flag(Zjkb<Zjb)flag��ʾmiss
        
    elseif(Zjkb<Zjb)           %truth ��cells��forecast��cells��ʱ
         [SEmin,SEmax,SEavg,SEd,SEr,SEt,RSE,D]=f_big(Zjk,Zj,Zjk_intensity,Zj_intensity);
         flag=1;
         
    elseif(Zjkb>Zjb) %truth ��cells��forecast��cells��ʱ
         [SEmin,SEmax,SEavg,SEd,SEr,SEt,RSE,D]=f_small(Zjk,Zj,Zjk_intensity,Zj_intensity);
         flag=-1;
      end
end