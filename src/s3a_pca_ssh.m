% The data quality is judged by the number of the valid points. The PCA
% loction is calculated. The SSH at the PCA points are calcalated. The PCA
% SSH are wrote out.
function s3a_pca_ssh(min_cir,max_cir,pass_num,lat_gps,lon_gps,loc)

% lat_gps=36.2667;% Location of QLY
% lon_gps=121.3850;
fid4=fopen('..\test\s3a_check\pca_ssh.txt','w');
    for i=min_cir:max_cir
            temp='..\test\s3a_check\';
            temp1=check_circle(i);% ���ú������ж�circle��λ����
            temp2=num2str(temp1);
            temp3=temp2(3:5);% �����λ�����ַ�����
            tmp=strcat('_',num2str(pass_num));
            temp4= strcat(temp,temp3,tmp,'.dat');
            temp5= strcat('X',temp3,tmp);
            
        if exist(temp4,'file')
            
            load (temp4) %����SSH�ļ�
            temp6=eval(temp5);% �ַ�����������ʹ�ã�temp5��load�����ı�����һ����
            aa=size(temp6);
            % ����aa(1)��ʾ��Ч�Ĺ۲��������������6�����ʾ���������ϲע��Ҫ�޸Ķ�Ӧ��saral1.txt�ļ�����ĸ���Ҫ����һ�£�����ά���Բ��ϡ�
            if aa(1)>5 % ��ʾ��Ч��������5����ռ������һ�롣���ֵ���Ը������������޸ġ�40HZ����Ϊ10
                if strcmp(loc,'zmw') 
                    lat3=39.903; % �����ֵ��Jason-2�����������й�ϵ�������ʵ��ĵ�����
                    pca_ssh=interp1(temp6(:,2),temp6(:,4),lat3,'PCHIP');
                    tim_pca=interp1(temp6(:,2),temp6(:,3),lat3,'liner');
                    lon3=interp1(temp6(:,2),temp6(:,1),lat3,'liner');
                    fprintf(fid4,'%12.6f %12.6f %12.6f %12.6f %3d\n',lat3,lon3,tim_pca,pca_ssh,i);% ����
                else
                    [lat3,lon3,tim_pca]=pca(temp4,lat_gps,lon_gps); % ���ú���������PCA
                    pca_ssh=interp1(temp6(:,2),temp6(:,4),lat3,'PCHIP');
                    fprintf(fid4,'%12.6f %12.6f %12.6f %12.6f %3d\n',lat3,lon3,tim_pca,pca_ssh,i);% ����
                end
            end
            
        end
        
    end 
%     workdir;
%     cd .\qianliyan_tg_cal
%     !grad
%     workdir;
disp('Finish!')
fclose('all');
return