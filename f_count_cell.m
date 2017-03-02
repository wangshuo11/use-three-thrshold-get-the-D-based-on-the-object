function count_cell=f_count_cell(I2,threshold_lunkuo)
%计算该文件中有多少个cell
   
   [counters1,L] = bwboundaries(I2,'noholes');
   [len_counters1,b] =size(counters1);
    count_cell=0;
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
            count_cell=count_cell+1;
       end
      end
     end
   end
end