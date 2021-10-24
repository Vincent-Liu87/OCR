function classification_data = class_train(X, Y)
numfeatures = size(X,1);
numsamples = size(Y,2);

data = struct('class1', zeros(2,numfeatures), 'class2', zeros(2,numfeatures), 'class3', zeros(2,numfeatures), 'class4', zeros(2,numfeatures), 'class5', zeros(2,numfeatures), 'class6', zeros(2,numfeatures), 'class7', zeros(2,numfeatures), 'class8', zeros(2,numfeatures), 'class9', zeros(2,numfeatures), 'class10', zeros(2,numfeatures)); 

%separate the features for 2 classes
class1Y = [find(Y(1,:)==1)];
class2Y = [find(Y(1,:)==2)];
class3Y = [find(Y(1,:)==3)];
class4Y = [find(Y(1,:)==4)];
class5Y = [find(Y(1,:)==5)];
class6Y = [find(Y(1,:)==6)];
class7Y = [find(Y(1,:)==7)];
class8Y = [find(Y(1,:)==8)];
class9Y = [find(Y(1,:)==9)];
class10Y = [find(Y(1,:)==10)];
class1X = X(:,class1Y); 
class2X = X(:,class2Y);
class3X = X(:,class3Y);
class4X = X(:,class4Y);
class5X = X(:,class5Y);
class6X = X(:,class6Y);
class7X = X(:,class7Y);
class8X = X(:,class8Y);
class9X = X(:,class9Y);
class10X = X(:,class10Y);

%assumed gaussian distribution, calculate the mean and standard deviation
%of features
for f = 1:numfeatures
    parameters1 = class1X(f,:);
    parameters2 = class2X(f,:);
    parameters3 = class3X(f,:);
    parameters4 = class4X(f,:);
    parameters5 = class5X(f,:);
    parameters6 = class6X(f,:);
    parameters7 = class7X(f,:);
    parameters8 = class8X(f,:);
    parameters9 = class9X(f,:);
    parameters10 = class10X(f,:);
    data.class1(:,f) = transpose([mean(parameters1), std(parameters1)]); 
    data.class2(:,f) = transpose([mean(parameters2), std(parameters2)]); 
    data.class3(:,f) = transpose([mean(parameters3), std(parameters3)]); 
    data.class4(:,f) = transpose([mean(parameters4), std(parameters4)]); 
    data.class5(:,f) = transpose([mean(parameters5), std(parameters5)]); 
    data.class6(:,f) = transpose([mean(parameters6), std(parameters6)]); 
    data.class7(:,f) = transpose([mean(parameters7), std(parameters7)]); 
    data.class8(:,f) = transpose([mean(parameters8), std(parameters8)]); 
    data.class9(:,f) = transpose([mean(parameters9), std(parameters9)]); 
    data.class10(:,f) = transpose([mean(parameters10), std(parameters10)]); 
end

classification_data = data; 
end