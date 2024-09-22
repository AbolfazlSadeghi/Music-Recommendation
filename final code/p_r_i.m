function [predict_rate,average_sim_item] = p_r_i( data,user,item,N )
[L_users,L_items]=size(data);
R_bar_item=mean(data(:,item));

sim_i = ad_cosine_i(data,item);
[i_ind]=(1:L_items);

%% start bubblesort
% p = length(sim_i);
% count = 0;
% y = sim_i;
% y_ind=i_ind;
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
% sim_i=y;
% i_ind=y_ind;
% end bubblesort
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% normal sort

for i=1:L_items-1
    for j=i+1:L_items
        if(sim_i(1,i)<sim_i(1,j))
            sim_i_temp=sim_i(1,i);
            sim_i(1,i)=sim_i(1,j);
            sim_i(1,j)=sim_i_temp;
            
            i_ind_temp=i_ind(1,i);
            i_ind(1,i)=i_ind(1,j);
            i_ind(1,j)=i_ind_temp;
        end
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
sim_N_neighbor=sim_i(1,2:N+1);
ind_N_neighbor=i_ind(1,2:N+1);

sigma_sim=sum(sim_N_neighbor,2);
sigma_abs_sim=sum(abs(sim_N_neighbor),2);
m=mean(data(:,ind_N_neighbor),1);

sigma_sim_rate=sum(sim_N_neighbor.*(data(user,ind_N_neighbor)-reshape(m,1,N)),2);

average_sim_item=sigma_sim/N;
predict_rate=R_bar_item+sigma_sim_rate/sigma_abs_sim;
end

