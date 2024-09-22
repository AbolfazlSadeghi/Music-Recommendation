%% This is a A Novel Hybrid Collaborative Filtering Algorithm Research
% for Music Recommendation

clear all; close all; clc;

%% load database
tic
% filename='db.xlsx';
% db = xlsread(filename);

filename='example.mat';
db1=importdata(filename);
[L_users,L_items]=size(db1);
t_s_percent=100;
t_s_L=round((t_s_percent/100)*L_users);
t_s_i=round((t_s_percent/100)*L_items);
db=db1(1:t_s_L,1:t_s_i);
db=sparse(db);
L_users=t_s_L;
L_items=t_s_i;

%% convert play_counts to rating between [0,1]
[x,y]=find(db>1 & db<=2);
db(x,y)=1.5;
[x,y]=find(db>2 & db<=4);
db(x,y)=2;
[x,y]=find(db>4 & db<=7);
db(x,y)=2.5;
[x,y]=find(db>7 & db<=11);
db(x,y)=3;
[x,y]=find(db>11 & db<=16);
db(x,y)=3.5;
[x,y]=find(db>16 & db<=22);
db(x,y)=4;
[x,y]=find(db>22 & db<=29);
db(x,y)=4.5;
[x,y]=find(db>29);
db(x,y)=5;

disp('start the predict');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% implement for example
N=4;

% sim_u = ad_cosine_u( db,3 );
% sim_i = ad_cosine_i( db,3 );

% predict_rate_u = p_r_u( db,5,1,N );
% predict_rate_i = p_r_i( db,5,3,N );

% predict=pred(db,7,6,N);

% pre_mat=zeros(L_users,L_items);
% for i=1:L_users
%     for j=1:L_items
%         pre_mat(i,j)=pred(db,i,j,N);
%     end
% end

MAE=zeros(L_users,1);
MAEu=zeros(L_users,1);
MAEi=zeros(L_users,1);
rec=zeros(L_users,3);
for i=1:L_users
    [rec(i,1:3),MAE(i,1),MAEu(i,1),MAEi(i,1)]=recommend(db,i,N);
    [q,r]=deconv(i,L_users);
    if (r==0) && mod(round(q*100),10)==0
        disp([num2str(round(q*100)),'% process is done']);
    end
end
MAE1=sum(MAE);
MAEu1=sum(MAEu);
MAEi1=sum(MAEi);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% implement for basic database

% [rec4,MAE4]=recommend(db,4,N);
% [rec13,MAE13]=recommend(db,13,N);
% [rec27,MAE27]=recommend(db,27,N);
% [rec28,MAE28]=recommend(db,28,N);
% [rec29,MAE29]=recommend(db,29,N);
% [rec32,MAE32]=recommend(db,32,N);
% [rec35,MAE35]=recommend(db,35,N);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
toc
