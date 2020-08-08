% Jason2 and Jason-3 are the same

function [pass_num,min_lat,max_lat,lat_gps,lon_gps]=readja2_cal_select_site(loc)

    switch lower(loc)
        case 'qly'
          disp('Your CAL site is: qianliyan')
          min_lat=36000000; % xlim([37.6 40]) for pass 9 YD
          max_lat=36500000; % xlim([36 36.7]) for pass 147 QLY
          pass_num=153;% define the pass number
          lat_gps=36.2672;% ǧ�����鳱վ������
          lon_gps=121.3853;
          
        case 'zh'
          disp('zhu hai')
          min_lat=21000000; % xlim([37.6 40]) for pass 9 YD
          max_lat=22200000; % xlim([36 36.7]) for pass 147 QLY
          pass_num=153;% define the pass number
          
        case 'cst' % ��ɽͷ
          disp('Your CAL site is: chengshantou')
          min_lat=37640000; % ����ʪ�ӳٵ�ʱ��Χ��������ƫ��
          max_lat=39000000; % 
          pass_num=153;% define the pass number
          lat_gps=37.3897;% ��ɽͷ�鳱վ������
          lon_gps=122.6968;
          
        case 'sdyt' % shandong YanTai
          disp('Your CAL site is: shandong yantai')
          min_lat=37500000; % ����ʪ�ӳٵ�ʱ��Χ��������ƫ��
          max_lat=40000000; % 
%           min_lat=30000000; % ����ʪ�ӳٵ�ʱ��Χ��������ƫ��
%           max_lat=36000000; % 
          pass_num=138;% define the pass number
          lat_gps=3.7482596e+01;% ��ɽͷ�鳱վ������
          lon_gps=1.2143555e+02;
      case 'fjpt' % shandong YanTai
          disp('Your CAL site is: Fujian pingtan')
          min_lat=24000000; % ����ʪ�ӳٵ�ʱ��Χ��������ƫ��
          max_lat=25100000; % 
%           min_lat=24500000; % ����ʪ�ӳٵ�ʱ��Χ��������ƫ��
%           max_lat=25000000; % 
          pass_num=164;% define the pass number
          lat_gps=2.5502154e+01;% GNSS������
          lon_gps=1.1976872e+02;% 1.1976872e+02 2.5502154e+01
          
       case 'hisy' % shandong YanTai
          disp('Your CAL site is: Hainan sanya')
          min_lat=16000000; % ����ʪ�ӳٵ�ʱ��Χ��������ƫ��
          max_lat=18200000; % 
%           max_lat=17900000; % 
%           min_lat=16500000; % ����ʪ�ӳٵ�ʱ��Χ��������ƫ��
%           max_lat=17500000; %           
          pass_num=77;% define the pass number
          lat_gps=1.8235778e+01;% GNSS������
          lon_gps=1.0953055e+02;% 1.0953055e+02 1.8235778e+01

       case 'yong' % shandong YanTai
          disp('Your CAL site is: Yong xing dao P153')
          min_lat=15000000; % ����ʪ�ӳٵ�ʱ��Χ��������ƫ��
          max_lat=18000000; % 
          
%           min_lat=16500000; % ����ʪ�ӳٵ�ʱ��Χ��������ƫ��
%           max_lat=17500000; %           
          pass_num=153;% define the pass number
          lat_gps=1.6834028e+01;% GNSS������
          lon_gps=1.1233533e+02;%  

       case 'yong2' % shandong YanTai
          disp('Your CAL site is: Yong xing dao P114')
          min_lat=16000000; % ����ʪ�ӳٵ�ʱ��Χ��������ƫ��
          max_lat=19000000; % 
          
%           min_lat=16500000; % ����ʪ�ӳٵ�ʱ��Χ��������ƫ��
%           max_lat=17500000; %           
          pass_num=114;% define the pass number
          lat_gps=1.6834028e+01;% GNSS������
          lon_gps=1.1233533e+02;%  
          
        case 'zmw' % zhimaowan
          disp('Your CAL site is: zhimaowan')
          min_lat=39000000; % ����ʪ�ӳٵ�ʱ��Χ��������ƫ��
          max_lat=41000000; % 
          pass_num=138;% define the pass number    
          lat_gps=40.0094;% ��ê���鳱վ������
          lon_gps=119.9200;    
        otherwise
          disp('Unknown location.')
    end
    
    if exist('..\test\ja2_check\','dir')==0
        disp('creat new dir to save the temp files') 
        mkdir('..\test\ja2_check\');
    end
    
    if exist('..\test\ja3_check\','dir')==0
        disp('creat new dir to save the temp files') 
        mkdir('..\test\ja3_check\');
    end
return