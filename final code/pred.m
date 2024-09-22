function [predict,MAE,MAEu,MAEi] = pred( data,user,item,N )

[L_users,L_items]=size(data);
[predict_rate_u,average_sim_user] = p_r_i( data,user,item,N );
[predict_rate_i,average_sim_item] = p_r_u( data,user,item,N );

% weight=0.4;  %% weight is w
% if average_sim_user==0 && average_sim_item==0
%     landa_u=0;
% else
%     landa_u= (weight*average_sim_user) / ((weight*average_sim_user) + (1-weight)*average_sim_item);
% end

weight=average_sim_user/average_sim_item;  %% weight is w
if average_sim_user==0 && average_sim_item==0
    landa_u=0;
else
    landa_u= (weight*average_sim_user) / ((weight*average_sim_user) + (1-weight)*average_sim_item);
end

% if abs(average_sim_user)<=abs(average_sim_item)
%     weight=0;
% elseif abs(average_sim_user)>abs(average_sim_item)
%     weight=1;
% end
% landa_u= (weight*average_sim_user) / ((weight*average_sim_user) + (1-weight)*average_sim_item);

landa_i=1-landa_u;

predict=(landa_u*predict_rate_u) + (landa_i*predict_rate_i);

MAEu=abs(data(user,item)-predict_rate_u)/N;
MAEi=abs(data(user,item)-predict_rate_i)/N;
MAE=abs(data(user,item)-predict)/N;

end

