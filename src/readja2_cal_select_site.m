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
          disp('chenshantou')
          min_lat=37640000; % ����ʪ�ӳٵ�ʱ��Χ��������ƫ��
          max_lat=39000000; % 
          pass_num=153;% define the pass number
          lat_gps=37.3897;% ��ɽͷ�鳱վ������
          lon_gps=122.6968;
          
        case 'zmw' % zhimaowan
          disp('zhimaowan')
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
return