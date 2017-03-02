function intensities=f_new_intensities(inputpath,threshold_area,threshold_rainfall,threshold_lunkuo)
%读入文件file，计算file文件的各个区域的Cx,Cy,Cmin,Cmax,Cavg，
   fid=fopen(inputpath,'r');
   I0=fread(fid,7808,'float32');
   I1=reshape(I0,128,61);
   I2=I1;
   I2(I2<=threshold_rainfall)=0;
   I2(I2>threshold_rainfall)=1;
   fclose(fid);
   I2=bwareaopen(I2,threshold_area,8);
   [counters1,L] = bwboundaries(I2,'noholes');
   [len_counters1,b] =size(counters1);
   count_flag=1;
   count_cell=f_count_cell(I2,threshold_lunkuo);
   intensities=zeros(count_cell,5);
   for counters1_i=1:len_counters1
      [len_temp,b]=size(cell2mat(counters1(counters1_i,1)));
     if(len_temp>threshold_lunkuo)
         xy=cell2mat(counters1(counters1_i,1));
         x=xy(:,1);
         y=xy(:,2);
      flag=isfitellipse(x,y);
      if(flag)
        cell_res=  fitellipse(x,y);
        max_b=max(cell_res(1,1),cell_res(1,2));
        min_a=min(cell_res(1,1),cell_res(1,2));
       if(~(max_b>15*min_a))
            countx=0;
            county=0;
            Cmin=0;
            Cmax=0;
            Cavg=0;
            sum=0;
            count_num=0;
         for i=1:128
            for j=1:61
                if( L(x(1,1),y(1,1 ))== L(i,j) )
                    countx=countx+i;
                    county=county+j;
                    sum=sum+I1(i,j);
                    if(count_num==0)
                        Cmin=I1(i,j);
                        Cmax=I1(i,j);
                    else
                        if(Cmin>I1(i,j))
                            Cmin=I1(i,j);
                        end
                        if(Cmax<I1(i,j))
                           Cmax=I1(i,j);
                        end
                    end
                    count_num=count_num+1;
                end
            end
         end
         Cx=countx/count_num;
         Cy=county/count_num;
         Cavg=sum/count_num;
         intensities(count_flag,1)=Cx;
         intensities(count_flag,2)=Cy;
         intensities(count_flag,3)=Cmin;
         intensities(count_flag,4)=Cmax;
         intensities(count_flag,5)=Cavg;
         count_flag=count_flag+1;
       end
      end
     end
   end
   
end