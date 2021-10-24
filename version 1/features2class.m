function y = features2class(x, classification_data)

numfeatures = size(x,1);
numsamples = size(x,2);
y = zeros(1, numsamples);

for i = 1:numsamples 
    y1_total = 0;
    y2_total = 0;
    y3_total = 0;
    y4_total = 0;
    y5_total = 0;
    y6_total = 0;
    y7_total = 0;
    y8_total = 0;
    y9_total = 0;
    y10_total = 0;
    for f = 1:numfeatures 
        %take the value of the feature f of sample n 
        mean1f = classification_data.class1(1, f); 
        stdv1f = classification_data.class1(2, f); 
        mean2f = classification_data.class2(1, f); 
        stdv2f = classification_data.class2(2, f); 
        mean3f = classification_data.class3(1, f); 
        stdv3f = classification_data.class3(2, f); 
        mean4f = classification_data.class4(1, f); 
        stdv4f = classification_data.class4(2, f); 
        mean5f = classification_data.class5(1, f); 
        stdv5f = classification_data.class5(2, f); 
        mean6f = classification_data.class6(1, f); 
        stdv6f = classification_data.class6(2, f); 
        mean7f = classification_data.class7(1, f); 
        stdv7f = classification_data.class7(2, f); 
        mean8f = classification_data.class8(1, f); 
        stdv8f = classification_data.class8(2, f); 
        mean9f = classification_data.class9(1, f); 
        stdv9f = classification_data.class9(2, f); 
        mean10f = classification_data.class10(1, f); 
        stdv10f = classification_data.class10(2, f); 
        
        y1 = normpdf(x(f, i), mean1f, stdv1f); 
        y2 = normpdf(x(f, i), mean2f, stdv2f);
        y3 = normpdf(x(f, i), mean3f, stdv3f);
        y4 = normpdf(x(f, i), mean4f, stdv4f);
        y5 = normpdf(x(f, i), mean5f, stdv5f);
        y6 = normpdf(x(f, i), mean6f, stdv6f);
        y7 = normpdf(x(f, i), mean7f, stdv7f);
        y8 = normpdf(x(f, i), mean8f, stdv8f);
        y9 = normpdf(x(f, i), mean9f, stdv9f);
        y10 = normpdf(x(f, i), mean10f, stdv10f);
        
        y1_total = y1_total + log(y1);
        y2_total = y2_total + log(y2);
        y3_total = y3_total + log(y3);
        y4_total = y4_total + log(y4);
        y5_total = y5_total + log(y5);
        y6_total = y6_total + log(y6);
        y7_total = y7_total + log(y7);
        y8_total = y8_total + log(y8);
        y9_total = y9_total + log(y9);
        y10_total = y10_total + log(y10);
    end
    
    probs = [y1_total, y2_total, y3_total, y4_total, y5_total, y6_total, y7_total, y8_total, y9_total, y10_total];
    [~, max_pos]=max(probs);
    y(i)=max_pos;
    
end

end 