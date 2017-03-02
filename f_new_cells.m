% f_cells()��Ҫ�����ÿ������cell��(x+i*sin(angle)*y...)��������ʾ����Z,
%�ڼ����ÿ��cell��Z_intensity(Cx,Cy,Cmin,Cmax,Cavg)��Cell������(Cx,Cy)����ˮǿ����Сֵ���ֵ�Լ���ֵ��Cmin,Cmax,Cavg��
function [Z,Z_intensity]=f_new_cells(file,threshold_area,threshold_rainfall,threshold_lunkuo)

intensity=f_new_intensities(file,threshold_area,threshold_rainfall,threshold_lunkuo);  %f_intensity()���ڼ���Cell������(Cx,Cy)����ˮǿ����Сֵ���ֵ�Լ���ֵ��Cmin,Cmax,Cavg��
[k,b]=size(intensity);
Z_intensity=intensity';         %��������ת�ã�ת�ú�ÿһ�б�ʾ��Ӧcell������(Cx,Cy)����ˮǿ����Сֵ���ֵ�Լ���ֵ��Cmin,Cmax,Cavg��
intensity=intensity';
Z=zeros(8,k);                   %��ʼ��Z
if(k>0) 
  counter=f_get_counters(file,threshold_area,threshold_rainfall,threshold_lunkuo);
end          %ѭ������ÿ��cell��������ʾ,��Z_intensity()��Ӧ�Ŵ洢��Z��
 for j=1:k
    Cx=intensity(1,j);
    Cy=intensity(2,j);
    Res=f_angle(counter{j},Cx,Cy);
    Z(:,j)=f_Z(Res);            %f_z()������Ҫ���ڷ��ؼ����cells��������ʾZ(x+y*i....)
 end
end