% Plot the altimeter data and have a quick look of the data
function quicklook_alti(min_cir,max_cir,min_lat,max_lat,pass_num,sat)
% ###############################################
% draw figure for statistic 
if sat==5
    disp('------Sa3----')
    load ..\test\s3a_check\ponits_circle.txt
    load  ..\test\s3a_check\ponits_number.txt
    fid4=fopen('..\test\s3a_check\statistic.txt','w');
    temp='..\test\s3a_check\';
elseif sat==1
    disp('------Jason-2----')
    load ..\test\ja2_check\ponits_circle.txt
    load  ..\test\ja2_check\ponits_number.txt
    fid4=fopen('..\test\ja2_check\statistic.txt','w');
    temp='..\test\ja2_check\';
elseif sat==4
    disp('------Jason-3----')
    load ..\test\ja3_check\ponits_circle.txt
    load  ..\test\ja3_check\ponits_number.txt
    fid4=fopen('..\test\ja3_check\statistic.txt','w');
    temp='..\test\ja3_check\';
end

latitude=ponits_circle(:,1);
points=ponits_circle(:,2);
cir_number=ponits_number(:,2);
circle=ponits_number(:,1);

figure(1);
hold on

plot(latitude,points,'o')
xlabel('latitude/\circ')
ylabel('Cycle number')
ylim([min(points) max(points)]);
xlim([min_lat/1E6 max_lat/1E6])

for i=1:length(circle)
text(36.48,circle(i),num2str(cir_number(i)),'FontSize',10)
end

grid on
hold off
% *************************************************************************
% ��ͼSSHÿ���ڹ۲�ֵ���Լ���ֵ

a(1:(max_cir-min_cir+1))=0;% �洢SSH

figure(2);
hold on
for i=min_cir:max_cir
% for i= [200] % ֻ����һ�����ڵ�һ��pass���ݣ�����i [200] ��ʾ200����

        
        temp1=check_circle(i);% ���ú������ж�circle��λ����
        temp2=num2str(temp1);
        temp3=temp2(3:5);% �����λ�����ַ�����
        tmp=strcat('_',num2str(pass_num));
        temp4= strcat(temp,temp3,tmp,'.dat');
        temp5= strcat('X',temp3,tmp);
    if exist(temp4,'file')
        load (temp4)
        temp6=eval(temp5);% �ַ�����������ʹ�ã�temp5��load�����ı�����һ����
        
        if size(temp6)~=0
            latitude=temp6(:,2);
            ssh_=temp6(:,5);
            a(i-min_cir+1)=mean(ssh_);% ����SSH��ֵ
%           b(i-min_cir+1)=std(points);% ����std
            fprintf(fid4,'%12d %12.6f \n',i,a(i-min_cir+1));% ����

            plot(latitude,ssh_,'-o')
            xlabel('Latitude/\circ')
            ylabel('SSH/m') 
        end
    end
end 

fclose(fid4);

xlim([min_lat/1E6 max_lat/1E6])

hold off

% clear all
figure (3)
temp5= strcat(temp,'statistic.txt');
load (temp5)
plot(statistic(:,1),statistic(:,2),'-o');
xlabel('cycle bumber')
ylabel('MSSH/mm')
legend('Mean')


return