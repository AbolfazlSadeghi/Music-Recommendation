function sim= ad_cosine_u( data,user1 )

[L_users,L_items]=size(data);
R_bar=mean(data,1);
sim=zeros(L_users,1);
for user2=1:L_users
sim(user2,1)=sum((data(user1,:)-R_bar).*(data(user2,:)-R_bar));
sim(user2,1)=sim(user2,1)/(sqrt(sum((data(user1,:)-R_bar).^2)) * sqrt(sum((data(user2,:)-R_bar).^2)));
end
end


