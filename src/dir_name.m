% ��ȡĿ¼����ΪĿ¼ѭ���ṩ�ļ���������
% Get the name of directory
function b=dir_name(dir_0)
    cd (dir_0);
    bb=ls;
    t=size (bb);
    b=bb(3:t,:);% 3��ʾ�͵����п�ʼ����Ϊǰ�����������ַ�
    cd C:\Users\yangleir\Documents\MATLAB\CAL\matlab_dell\CalALti\src;

return