%������(Cx,Cy)Ϊƫ�����ĵ㣬�������ƫ�ǣ�2*pi(L-1)(/A-1)��,L=0,1...A-1)ֵ���߽�����edge
%���ཻ�����ص�����ꡣ�������ص��ƫ��ֵ����ĳ��������������ĵ�ƫ��alpha������ƫ��angle���С��pi/16ʱ��
%�ɿ���ʹ�ø�λ�ü�¼Ϊ��Ӧ��ƫ��λ�ã����ж��λ������ʱ��ʹ�������С����Ϊ���λ�á�
%�������ķ�Χ���Ҳ������ʵĵ�������ƫ��anglgʱ��߽�����Ľ���ʱ��ȡ�������ص��е����ĵ���Զ��R��
%��¼��λ��Ϊx=Cx+R*sin(angle),y=Cy+R*cos(angle)
function Z=f_Z(Res)
  [a,b]=size(Res);
  Z1=zeros(16,1);
  [Rmax,k]=max(Res(:,5));
  X_Rmax=Res(k,1);
  Y_Rmax=Res(k,2);
  flag=pi/16;    %���������
for i=0:7
    angle=i*2*pi/8;
    t_min=5*pi;
    for j=1:a
        t_cha=abs(Res(j,3)-angle);
        t_abs=abs(t_min-angle);
        if(t_cha<t_abs)
            t_r=Res(j,5);
            t_min=Res(j,3);
            tx=Res(j,1);
            ty=Res(j,2);
        end
    end
    if(abs(t_min-angle)>flag)
      t_r=Rmax;
      t_min=angle;
      tx=X_Rmax;
      ty=Y_Rmax;
    end
    Z1(i+1,1)=tx;   %Z1��Z1(1,1:8)����˳����x����,Z1(1,9:16)����˳����y����
    Z1(i+9,1)=ty;
end
Z=complex(Z1(1:8),Z1(9:16));     % �任��Zj=(x+i*y,....)��ʽ
end