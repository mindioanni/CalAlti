% �޳��������������Ĺ۲�ֵ
function [tmpp,ttt,tim2]=three_sigma_delete2(tmpp,ttt,tim2)

hehe=std(tmpp);% tmpp��ʾ��Ҫ���������ݣ�tttû��ʵ�����á�
hehe2=mean(tmpp);
hehe3=hehe2+3*hehe;
hehe4=hehe2-3*hehe;
[n]=find(tmpp(:,1)>hehe3);
tmpp(n,1)=NaN;
[n]=find(tmpp(:,1)<hehe4);
tmpp(n)=NaN;
ttt(any(isnan(tmpp), 2),:) = [];
tim2(any(isnan(tmpp), 2),:) = [];
tmpp(any(isnan(tmpp), 2),:) = [];%��NaN����ȥ��

return