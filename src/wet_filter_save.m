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
    bias2_radio=[ttt tmpp tim2];

    % plot(bias2(:,1),bias2(:,2),'+')
    disp('radiometer-gnss')
    bias_mean=mean (bias2_radio(:,2))
    bias_std=std(bias2_radio(:,2))
    
    %=====================================================================
    bias_model=bias2(:,4);
    ttt=bias2(:,1);
    tim2=bias2(:,3);
    
    [bias_model,ttt,tim2]=three_sigma_delete2(bias_model,ttt,tim2);% Ϊ�˱���ʱ����Ϣ������������޳�����Ϊthree_sigma_delete2��ԭΪthree_sigma_delete
    [bias_model,ttt,tim2]=three_sigma_delete2(bias_model,ttt,tim2);
    [bias_model,ttt,tim2]=three_sigma_delete2(bias_model,ttt,tim2);
    % [tmpp,ttt,tim2]=three_sigma_delete2(tmpp,ttt,tim2);
    bias2_model=[ttt bias_model tim2];

    % plot(bias2(:,1),bias2(:,2),'+')
    disp('model-gnss')
    bias_mean=mean (bias2_model(:,2))
    bias_std=std(bias2_model(:,2))
    %=====================================================================

    % plot_bias(bias2,sat)
if sat==1
    save ..\test\ja2_check\jason_2_bias_wet_new.txt bias2_radio -ASCII % ����������
    save ..\test\ja2_check\jason_2_bias_wet_model_new.txt bias2_model -ASCII % ����������
elseif sat==4
    save ..\test\ja3_check\jason_3_bias_wet_new.txt bias2_radio -ASCII % ����������
    save ..\test\ja3_check\jason_3_bias_wet_model_new.txt bias2_model -ASCII % ����������
elseif sat==3
    save ..\test\hy2_check\hy2_bias_wet_new.txt bias2_radio -ASCII % ����������
    save ..\test\hy2_check\hy2_bias_wet_model_new.txt bias2_model -ASCII % ����������
    
end
    % ���Ʒ���
    [P]=trend_bias(bias2_radio,sat,min_cir,max_cir);
    [P]=trend_bias(bias2_model,sat,min_cir,max_cir);
return