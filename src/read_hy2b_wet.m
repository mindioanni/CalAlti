% Read the hy2b wet delay and check the difference between the model and
% radiometer.

clear; %
clc; % 
format long

dir_0='C:\Users\yangleir\Downloads\hy2b\IDR_2M\';% data directory 

cir=17;% choose one cycle
nm=cir;

temp1=check_circle(nm);% ���ú������ж�circle��λ����
temp2=num2str(temp1);
temp3=temp2(2:5);% �����λ�����ַ�����
dir_nm=strcat(dir_0,temp3,'\') ;% ����ļ�������

namelist = ls(fullfile(dir_nm,'*.nc'));% ����ls���Ժ�dir�滻
len=size(namelist);
len=len(1);
    
for  n=1:len
    t1=str2double(namelist(n,24:26));

    filepath=strcat(dir_nm,namelist(n,1:61));

    nc=netcdf.open(filepath,'NC_NOWRITE');
    lat=netcdf.getVar(nc,6);%10-6��
    lon=netcdf.getVar(nc,7);%10-6��
    time=netcdf.getVar(nc,0);%10-6��

    wet=netcdf.getVar(nc,63);%10-4m,rad
    wet_m=netcdf.getVar(nc,62);%10-4m,medel

    netcdf.close(nc)

    outfile=strcat('..\test\hy2_check\',namelist(n,18:26),'.txt');% ֻȡ���ں�pass���
    fid2 = fopen(outfile,'w');

    for i=1:length(lon)              
        if ((-5000<=wet(i)&&wet(i)<=-10))
            fprintf(fid2,'%12.6f %12.6f %12.6f %12.6f %12.6f\n',double(lon(i))/1E6,double(lat(i))/1E6,double(wet(i))/1E1,double(wet_m(i))/1E1,time(i));
        end
    end
    fclose(fid2);

end
