% Plot the altimeter data and have a quick look of the data
function quicklook_alti(min_cir,max_cir,min_lat,max_lat,pass_num)
% ###############################################
% draw figure for statistic 

load ..\test\s3a_check\ponits_circle.txt
load  ..\test\s3a_check\ponits_number.txt

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
fid4=fopen('..\test\s3a_check\statistic.txt','w');

figure(2);
hold on
for i=min_cir:max_cir
% for i= [200] % ֻ����һ�����ڵ�һ��pass���ݣ�����i [200] ��ʾ200����

        temp='..\test\s3a_check\';
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
% plot ([36.7 36.7],[-500 0],'LineWidth',2)
% plot ([36.3 36.3],[-500 0],'LineWidth',2)
% plot ([34.4 34.4],[-500 0],'LineWidth',2)
% text(36.3,min_y+10,'\leftarrow ǧ����','FontSize',10)
% text(36.4,min_y+5,'��½\rightarrow ','FontSize',10)
% text(34.4,min_y+5,'\leftarrow ��½','FontSize',10)
hold off

% clear all
figure (3)
load ..\test\s3a_check\statistic.txt
plot(statistic(:,1),statistic(:,2),'-o');
xlabel('cycle bumber')
ylabel('MSSH/mm')
legend('Mean')


return