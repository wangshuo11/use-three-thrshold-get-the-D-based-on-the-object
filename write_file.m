function write_file( filename,source_matrix )
    %TEST Summary of this function goes here
    %  write matrix to file
    fid=fopen(filename,'a');
    [x,y]=size(source_matrix);
    for i=1:x
        for j=1:y-1
            fprintf(fid,'%s\x20',num2str(source_matrix(i,j)));
        end
        fprintf(fid,'%s\r\n',num2str(source_matrix(i,y)));%ÿһ�лس�\n
    end
    fclose(fid);
end
% filename�����ǵ��ļ�·�����ļ�����
% source_matrix ��������Ҫ����ľ���