%f_hash_date��Ҫ�����ļ���˳��i������������Ӧ�����ڣ��������ڷ���date[][]�У����ڲ���%
function date= f_hash_date
    filenum=4381;
	month = [ 31, 31;     %month[][0]��ʾƽ���·ݵ�������month[][1]��ʾ�����·ݵ�����
		28, 29;
		31, 31;
		30, 30;
		31, 31;
		30, 30;
		31, 31;
		31, 31;
		30, 30;
		31, 31;
		30, 30;
		31, 31 ];
	day = 1; 
    mon = 1; 
    year = 2002;     %��ʼ��������Ϊ�ļ���ʼ����
    date=zeros(filenum+1,3);							   %ͨ��hash,���ν��ļ�˳����ֵi,����Ӧ�����ڷ���date[i][]��%
	for i = 0:filenum
		day = day + 1;
		if (day > month(mon ,f_isyear(year)+1))     %���������·�������day=1,mon++
			day = 1;
			mon = mon + 1;
        end
		if (mon > 12)             %�·ݴ���12���£�mon=1,year++
			mon = 1;
			year = year + 1;
        end
		%���浽date%
		date(i+1,1) = year;
		date(i+1,2)= mon;
		date(i+1,3) = day;
    end
end
