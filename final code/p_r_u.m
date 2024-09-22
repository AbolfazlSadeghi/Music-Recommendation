function [predict_rate,average_sim_user] = p_r_u( data,user,item,N )
[L_users,L_items]=size(data);
R_bar_user=mean(data(user,:));

sim_u = ad_cosine_u(data,user);
[u_ind]=(1:L_users)';

%% start bubblesort
% p = length(sim_u);
% count = 0;
% y = sim_u;
% y_ind=u_ind;
% m = p-1;
% while m > 0,
%     for i=1:m,
%         if y(i) < y(i+1)
%             
%             temp = y(i);
%             y(i) = y(i+1);
%             y(i+1) = temp;
%             
%             temp_ind=y_ind(i);
%             y_ind(i)=y_ind(i+1);
%             y_ind(i+1)=temp_ind;
%         end;
%         count = count+1;
%     end;
%     m = m-1;
% end
% sim_u=y;
% u_ind=y_ind;
% end bubblesort
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % normal sort
for i=1:L_users-1
    for j=i+1:L_users
        if(sim_u(i,1)<sim_u(j,1))
            sim_u_temp=sim_u(i,1);
            sim_u(i,1)=sim_u(j,1);
            sim_u(j,1)=sim_u_temp;
            
            u_ind_temp=u_ind(i,1);
            u_ind(i,1)=u_ind(j,1);
            u_ind(j,1)=u_ind_temp;
        end
    end
end
% % end sort
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
sim_N_neighbor=sim_u(2:N+1,1);
ind_N_neighbor=u_ind(2:N+1,1);

sigma_sim=sum(sim_N_neighbor);
sigma_abs_sim=sum(abs(sim_N_neighbor),1);
m=mean(data(ind_N_neighbor,:),2);

sigma_sim_rate=sum(sim_N_neighbor.*(data(ind_N_neighbor,item)-reshape(m,N,1)));

average_sim_user=sigma_sim/N;
predict_rate=R_bar_user+sigma_sim_rate/sigma_abs_sim;
end

