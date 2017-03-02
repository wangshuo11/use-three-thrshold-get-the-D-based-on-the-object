close all;
clear all;
clc;
filenum=4380;
T_res=zeros(1,9);   %暂存结果
threshold_area=8;
threshold_rainfall=25;
threshold_lunkuo=10;
for i=0:1:filenum
    str_truth=strcat('F:\\anal\\anal_',int2str(i));
    str_truth=strcat(str_truth,'.dat');
    str_forecast=strcat('F:\\fcst\\fcst_',int2str(i));
    str_forecast=strcat(str_forecast,'.dat');
[T_res(1,1),T_res(1,2),T_res(1,3),T_res(1,4),T_res(1,5),T_res(1,6),T_res(1,7),T_res(1,8),T_res(1,9)]=f_verification(str_truth,str_forecast,threshold_area,threshold_rainfall,threshold_lunkuo);
write_file('F:\\res5.txt',T_res);   %每次结果对应着追加到res.txt中
end
