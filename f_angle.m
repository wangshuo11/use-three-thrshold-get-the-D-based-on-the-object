 %�������أ������ÿ����������ӦRes=��x���꣬y����,��Ӧ��ƫ��angle�������ĵ�ľ࣬�������ޣ�
%���صĽ����һ������Res��ÿһ�зֱ��ǣ�x���꣬y����,��Ӧ��ƫ��angle�������ĵ�ľ࣬�������ޣ�
function Res=f_angle(boundary,Cx,Cy)
[k,b]=size(boundary);    %k�Ǳ߽����ĳ��ȣ�Ҳ�����ص����Ŀ
Res=zeros(k,5);         %��ʼ��Res()
for i=1:k
    tx=boundary(i,1);     %txȡ��iλ�����ص�x����
    ty=boundary(i,2);     %tyȡ��iλ�����ص�y����
    
   temp=(ty-Cy)/(tx-Cx);    %��������tan(y/x)
   value=atan(temp);        %���������ֵvalue����ƫ��
   Res(i,1)=tx;             %����iѭ������Res()������
   Res(i,2)=ty;
   dx=tx-Cx;                 %���ص������cell���ĵ������ֵ��dx,dy��
   dy=ty-Cy;
   if(dx>0)                     %�������ĵ�Ϊԭ�㣬��������ϵ���ж����ޣ�����ϵ�Ľ�����matlab��ͼ�������ϵһ��
       if(dy>=0)
           Res(i,4)=1;
             Res(i,3)=value;
             Res(i,5)=sqrt(dx*dx+dy*dy);
       end
   end
   if(dx<=0)
       if(dy>0)
           Res(i,4)=2;
           Res(i,3)=pi+value;
           Res(i,5)=sqrt(dx*dx+dy*dy);
       end
   end
   if(dx<0)
       if(dy<=0)
           Res(i,4)=3;
           Res(i,3)=value+pi;
           Res(i,5)=sqrt(dx*dx+dy*dy);
       end
   end
   if(dx>=0)
       if(dy<0)
           Res(i,4)=4;
             Res(i,3)=2*pi+value;
              Res(i,5)=sqrt(dx*dx+dy*dy);
       end
   end
end
end