%��Ҫ����Ѱ��δ������forecast��cells�о���truth��cell�����cell�����վͽ�ԭ��ƥ��,b��ʾcell����Ŀ��
%visit��¼�Ƿ񱻷��ʣ�0����δ�з��ʣ�(Cx,Cy)����truth��cell�����ĵ㣬
%Zjk_intensity�����forecast��cells������(Cx,Cy)����ˮǿ����Сֵ���ֵ�Լ���ֵ��Cmin,Cmax,Cavg��
function loc=f_equal_close(Cx,Cy,Zjk_intensity,visit,b)
loc=0;      %��ʼ��λ��loc=0
min_dis=0;   %��ʼ������min_dis=0;
    for i=1:b   
        t_Cx=Zjk_intensity(1,i);        %(tx_CX,ty_Cy)��Ӧ��forecast��i��cell����������
        t_Cy=Zjk_intensity(2,i);
        if(visit(i,1)==0)               %�жϸ�λ���Ƿ��Ѿ���ƥ��
            if(loc==0)                  %����ǵ�һ���ҵ�û���ʹ���cell����loc��min_dis
                loc=i;
                min_dis=sqrt((Cx-t_Cx)*(Cx-t_Cx)+(Cy-t_Cy)*(Cy-t_Cy));
            else 
                    if(min_dis>sqrt((Cx-t_Cx)*(Cx-t_Cx)+(Cy-t_Cy)*(Cy-t_Cy)))  %�ҵ������������δ�����ʣ������loc��min_dis
                        loc=i;
                        min_dis= sqrt((Cx-t_Cx)*(Cx-t_Cx)+(Cy-t_Cy)*(Cy-t_Cy));
                    end
            end
        end
        end
    visit(loc,1)=1;     %��Ǳ��β������forecast��cellΪ1�����Ѿ�����
end