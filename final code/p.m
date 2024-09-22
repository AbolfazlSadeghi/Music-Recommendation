clc; close all; clear all;
N=[10 20 30 40 50 60];

MAE= [0.57   0.544  0.548   0.542  0.539    0.53];
MAEi=[0.58   0.57   0.575   0.576   0.563    0.56];
MAEu=[0.65   0.62   0.61    0.59   0.60     0.57];
MAEp=[0.557   0.537   0.535    0.527    0.523    0.516];

N_length=length(N);

hold on
for nn=1:N_length
    x=N(nn);
    y=MAE(nn);
    yi=MAEi(nn);
    yu=MAEu(nn);
    yp=MAEp(nn);
    plot(x,y,'bo','LineWidth',5,'MarkerSize',2);
    plot(x,yi,'go','LineWidth',5,'MarkerSize',2);
    plot(x,yu,'ro','LineWidth',5,'MarkerSize',2);
    plot(x,yp,'r*','LineWidth',5,'MarkerSize',2);
end
plot(N,MAE,N,MAEi,N,MAEu,N,MAEp)

hold off 

leg=legend('hybrid','item-base','user-base','new hybrid');
set(gca, 'XTick', [10 20 30 40 50 60]); % Change x-axis ticks
set(gca, 'YTick', [0.5 0.52 0.54 0.56 0.58 0.60 0.62 0.64 0.66 0.68]); % Change y-axis ticks
xlabel('number of neighboor')
ylabel('MAE')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% clc; close all; clear all;
% w  =[0.2   0.3    0.4     0.5    0.6     0.7    0.8];
% MAE=[0.57  0.578  0.585   0.61   0.62    0.625   0.63];
% 
% w_length=length(w);
% 
% hold on
% 
% for nn=1:w_length
%     x=w(nn);
%     y=MAE(nn);
%     plot(x,y,'bo','LineWidth',5,'MarkerSize',2);
% end
% 
% plot(w,MAE)
% hold off 
% 
% leg=legend('hybrid');
% xlabel('Value of weighting')
% ylabel('MAE')
% axis=[0.1 0.9 0.5 0.78];
% set(gca, 'XTick', [0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8]); % Change x-axis ticks
% set(gca, 'YTick', [0.5 0.51 0.52 0.53 0.54 0.55 0.56 0.57 0.58 0.59 0.60 0.61 0.62 0.63 0.64 0.65 0.66 0.67 0.68]); % Change y-axis ticks




