% f_cells()主要计算出每个雨区cell的(x+i*sin(angle)*y...)的向量表示既是Z,
%在计算出每个cell的Z_intensity(Cx,Cy,Cmin,Cmax,Cavg)，Cell的中心(Cx,Cy)和雨水强度最小值最大值以及均值（Cmin,Cmax,Cavg）
function [Z,Z_intensity]=f_new_cells(file,threshold_area,threshold_rainfall,threshold_lunkuo)

intensity=f_new_intensities(file,threshold_area,threshold_rainfall,threshold_lunkuo);  %f_intensity()用于计算Cell的中心(Cx,Cy)和雨水强度最小值最大值以及均值（Cmin,Cmax,Cavg）
[k,b]=size(intensity);
Z_intensity=intensity';         %将计算结果转置，转置后每一列表示对应cell的中心(Cx,Cy)和雨水强度最小值最大值以及均值（Cmin,Cmax,Cavg）
intensity=intensity';
Z=zeros(8,k);                   %初始化Z
if(k>0) 
  counter=f_get_counters(file,threshold_area,threshold_rainfall,threshold_lunkuo);
end          %循环计算每个cell的向量表示,和Z_intensity()对应着存储在Z中
 for j=1:k
    Cx=intensity(1,j);
    Cy=intensity(2,j);
    Res=f_angle(counter{j},Cx,Cy);
    Z(:,j)=f_Z(Res);            %f_z()函数主要用于返回计算的cells的向量表示Z(x+y*i....)
 end
end