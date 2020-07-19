% ����̶�γ�ȵķ���ƴ���ʪ�ӳٲ�ֵ��ʱ���ֵ
% interpolation of  the wet delay to the fixed point.
function wet_inter(min_cir,max_cir,pass_num,loc)
if   strcmp(loc,'cst')
    lat3=37.7;% �˴���γ�ȴ�ž���½��20km��������յ���½�ظ��Ž�С���Ҿ���վ�����
elseif  strcmp(loc,'sdyt')
    lat3=37.833333; % 25km far from the mainland
elseif  strcmp(loc,'fjpt')
    lat3=25.1; % 25km far from the mainland
elseif  strcmp(loc,'hisy')
    lat3=18; % 25km far from the mainland
end 

% date_yj=[2010 1 1 0 0 0];% 
% t3=((datenum(date_yj)-datenum('2000-01-1 00:00:00')))*86400;
fid4=fopen('..\test\ja2_check\pca_wet.txt','w');
fid5=fopen('..\test\ja2_check\pca_wet_model.txt','w');
    temp11=check_circle(pass_num);% ���ú������ж�circle��λ����
    temp21=num2str(temp11);
    temp31=temp21(3:5);% �����λ�����ַ�����
    for i=min_cir:max_cir
%         i;
            temp='..\test\ja2_check\';
            temp1=check_circle(i);% ���ú������ж�circle��λ����
            temp2=num2str(temp1);
            temp3=temp2(3:5);% �����λ�����ַ�����
            

            
            tmp=strcat('_',temp31);
            temp4= strcat(temp,temp3,tmp,'.txt')
            temp5= strcat('X',temp3,tmp);
            
        if exist(temp4,'file')
            
            load (temp4) %����SSH�ļ�
            temp6=eval(temp5);% �ַ�����������ʹ�ã�temp5��load�����ı�����һ����
            aa=size(temp6);
            
            if aa(1)>20 % ��ʾ��Ч��������20����ռ������һ�롣���ֵ���Ը������������޸ġ�
                pca_wet=interp1(temp6(:,2),temp6(:,3),lat3,'pchip');
                pca_wet_model=interp1(temp6(:,2),temp6(:,4),lat3,'pchip');
                lon3=interp1(temp6(:,2),temp6(:,1),lat3,'pchip');
                tim_pca=interp1(temp6(:,2),temp6(:,5),lat3,'pchip');
%                 tmp=datestr(tim_pca/86400+datenum('2000-01-1 00:00:00'))%
%                 trasform the seconds to normal data format
                fprintf(fid4,'%12.6f %12.6f %12.6f %12.6f %3d\n',lat3,lon3,tim_pca,pca_wet,i);% ����
                fprintf(fid5,'%12.6f %12.6f %12.6f %12.6f %3d\n',lat3,lon3,tim_pca,pca_wet_model,i);% ����
            end
            
        end
        
    end 
disp('Finish!')
fclose('all');
return