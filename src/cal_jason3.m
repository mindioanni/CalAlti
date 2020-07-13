% ���ǲ�߶������
% BY Yang Lei,FIO,MNR of China.
% Email: leiyang@fio.org.cn

% ###############################################
clear; 
clc; 
workdir;
format long

min_cir=0;% 165
max_cir=106;% 239
loc = 'zmw';
sat=4;
fre=1;%��ʾѡ��ĸ߶ȼ��������ͣ���ƵΪ20 or 40����ƵΪ1.

[pass_num,min_lat,max_lat,lat_gps,lon_gps]=readja2_cal_select_site(loc);% ѡ��ص�ǧ���ң�jason3��jason-2����ͨ�á�

if fre==1
    tg_cal_read_jason3(pass_num,min_cir,max_cir,min_lat,max_lat);% ��ȡJason-3����
    elseif fre==20
    tg_cal_read_jason3_hi(pass_num,min_cir,max_cir,min_lat,max_lat);% TBD
end

ja3_pca_ssh(min_cir,max_cir,pass_num,lat_gps,lon_gps,loc);% ����PCA���Լ�PCA���SSH��ֵ

% ����ĳ����ٽ����Ż�����ǿ����������ԡ����ڵ������ǣ�ÿ�λ����ǣ���Ҫ�ֶ�������ϫ�������ļ���
% =========================================================================
[bias2]=qly_tg_pca_ssh(sat,fre,loc);% ����TG��PCAʱ�̵�SSH���������߾���ƫ��
% =========================================================================

% ���������ٴζ�HY-2�����������Լ�����޳��ֲ
% ע�⣡��һ���������һ����������ʱ�䷶Χ��
tmpp=bias2(:,2);
ttt=bias2(:,1);
[tmpp,ttt]=three_sigma_delete(tmpp,ttt);
bias2=[ttt tmpp];
% [bias2]=qly_short_tg_pca_ssh(sat);% ����TG��PCAʱ�̵�SSH���������߾���ƫ��
plot_bias(bias2,sat)

% [ymd]=sec2ydm(sat);% ʱ��ת����Ϊ��ʹ��GMT����biasʱ������
% ������������������������������������
% last_bias_save(sat);% ��ʱ�ӳ��򣬱���bias���ս��������ʱ��
% ������������������������������������

save jason_3_bias_new.txt bias2 -ASCII % ����������
% ���Ʒ���
[P]=trend_bias(bias2,sat,min_cir,max_cir);

% ��ͼ,����ͳ��
% bias1=bias2 (53:62,1:2);

% plot_bias2(sat)