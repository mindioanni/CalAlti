% fliter the bias of wet delay
% plot 
% save to file
function wet_filter_save(bias2,sat,min_cir,max_cir)
    tmpp=bias2(:,2);
    ttt=bias2(:,1);
    tim2=bias2(:,3);

    [tmpp,ttt,tim2]=three_sigma_delete2(tmpp,ttt,tim2);% Ϊ�˱���ʱ����Ϣ������������޳�����Ϊthree_sigma_delete2��ԭΪthree_sigma_delete
    [tmpp,ttt,tim2]=three_sigma_delete2(tmpp,ttt,tim2);
    [tmpp,ttt,tim2]=three_sigma_delete2(tmpp,ttt,tim2);
    % [tmpp,ttt,tim2]=three_sigma_delete2(tmpp,ttt,tim2);
    bias2=[ttt tmpp tim2];

    % plot(bias2(:,1),bias2(:,2),'+')
    bias_mean=mean (bias2(:,2))
    bias_std=std(bias2(:,2))

    % plot_bias(bias2,sat)

    save ..\test\ja2_check\jason_2_bias_wet_new.txt bias2 -ASCII % ����������
    % ���Ʒ���
    [P]=trend_bias(bias2,sat,min_cir,max_cir);
return