function sim= ad_cosine_i( data,item1 )

[L_users,L_items]=size(data);
R_bar=mean(data,2);
sim=zeros(1,L_items);
for item2=1:L_items
sim(1,item2)=sum((data(:,item1)-R_bar).*(data(:,item2)-R_bar));
sim(1,item2)=sim(1,item2)/(sqrt(sum((data(:,item1)-R_bar).^2)) * sqrt(sum((data(:,item2)-R_bar).^2)));
end
end


