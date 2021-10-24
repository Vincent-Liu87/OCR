function y = features2class(x, classification_data)    
    numfeatures = size(x,1);
    numsamples = size(x,2);
    [m,n] = size(classification_data);
    X = zeros(m, numfeatures);
    Y = zeros(m, 1);
    for i = 1:m
        X(i, :) = classification_data{i, 1};
        Y(i) = classification_data{i, 2};
    end
    %using 5 nearest neighbor
    y = zeros(1, numsamples);
    for i = 1:numsamples
        nearest_neighbors = transpose(X(1:5, :));
        dists = [Inf, Inf, Inf, Inf, Inf];
        yj = [1, 1, 1, 1, 1];
        for j = 1:m
            dist = norm(x(:, i)-transpose(X(j, :)));
            if dist<max(dists)
                [~, max_pos] = max(dists);
                %max_pos
                dists(max_pos) = dist;
                nearest_neighbors(:, max_pos) = transpose(X(j, :));
                yj(max_pos) = Y(j);
            end
        end
        y(i) = mode(yj);
    end
    %model = fitcknn(X, Y, 'NumNeighbors', 5);
    %y = predict(model, x');
end