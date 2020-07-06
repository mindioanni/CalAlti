% ����PCA
function [lat3,lon3,tim_pca]=pca(a1,a2,a3)

% a1�������ļ�����γ�ȣ�ʱ�䣬SSH_i����a2�����鳱վγ�ȣ�a3�����鳱վ����
% lat3,lon3,time_pca�����PCA��������ʱ��

tmp=load (a1);
len=length(tmp(:,1));
lon=tmp(:,1);
lat=tmp(:,2);

% ȷ����������Ĳ�ߵ�
% n��ʾ��GPS��������ڵ�һ�㣬lat(i)��ʾ��GPS�²�ĵ��γ�ȡ�
n=1;
% �����ѭ��������ͽ���֮���𣬵�������Գ���û��Ӱ�졣
% �����ѭ����ʹû���жϳ�i��λ�ã�Ҳ���Խ�������Ĵ�����Ĭ��n=1
% �˴�����һ������Ҫ������������ͽ���Ҫ�ֿ��Դ���
if lat(1) < lat(2)
    for i=1:len-1
       if(lat(i)<a2) && (lat(i+1)>a2) %|| ((lat(i)>a2) && (lat(i+1)<a2))   
            n=i;
        end
    end
end

if lat(1) > lat(2)
    for i=1:len-1
       if (lat(i)>a2) && (lat(i+1)<a2)
            n=i;
        end
    end
end

% haha=datestr (tmp(n+1,3)/(24*3600)+datenum('2000-01-01 00:00:00.0'));
% tim_pca=tmp(n+1,3); % ʱ��

a=atan((lat(n+1)-lat(n))/(lon(n+1)-lon(n)));%��ǽǶȣ�90���ȥ��λ��
k1=((lat(n+1)-lat(n))/(lon(n+1)-lon(n)));%��ǽǶȣ�90���ȥ��λ��
k2=-1/k1;

b1=lat(n)-k1*lon(n);
b2=a2-k2*a3;

lon3=(b2-b1)/(k1-k2);% ��PCA��γ��
lat3=k2*lon3+b2;

% �ҵ������PCA��֮���ٴ�ȷ��PCA���ʱ�䡣
if lat(1) < lat(2)
    for i=1:len-1
        if((lat(i)<lat3) && (lat(i+1)>lat3) )
          n=i;
        end
    end
end

if lat(1) > lat(2)
    for i=1:len-1
        if((lat(i)>lat3) && (lat(i+1)<lat3) )
          n=i;
        end
    end
end

tim_pca=tmp(n+1,3); % ʱ��,��ȷ���룬��������С���㡣�����ʱ����Ҫ�Ƕ��鳱վ�����ã���1s��ˮλ�仯�ɺ���

return