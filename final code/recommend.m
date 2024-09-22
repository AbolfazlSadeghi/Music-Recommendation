function [ rec,MAE,MAEu,MAEi] = recommend( data,user,N )

[L_users,L_items]=size(data);
pre_mat1=zeros(1,L_items);
for j=1:L_items
    [pre_mat1(1,j),MAE,MAEu,MAEi]=pred(data,user,j,N);
end
pre_mat_ind=1:1:L_items;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% start bubblesort
% p = length(pre_mat1);
% count = 0;
% y = pre_mat1;
% y_ind=pre_mat_ind;
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
% pre_mat1=y;
% pre_mat_ind=y_ind;
% end bubblesort
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% normal sort
for i=1:L_items
    for j=i+1:L_items
        if pre_mat1(1,j)>pre_mat1(1,i)
            temp=pre_mat1(1,i);
            pre_mat1(1,i)=pre_mat1(1,j);
            pre_mat1(1,j)=temp;
            temp_ind=pre_mat_ind(1,i);
            pre_mat_ind(1,i)=pre_mat_ind(1,j);
            pre_mat_ind(1,j)=temp_ind;
        end
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if pre_mat1(1,1)==0;
    rec=[0 0 0];
else
    k=3;
    rec=pre_mat_ind(1,1:k);
end
end

