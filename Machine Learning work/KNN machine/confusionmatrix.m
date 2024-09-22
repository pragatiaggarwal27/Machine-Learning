function [ CON, A, P, R, F1 ] = confusionmatrix(ypred, yactual)

a = 0;
b = 0;
c = 0;
d = 0;

for i = 1:length(ypred)
    if ypred(i) == 1 && yactual(i) == 1
        a = a + 1; % True Positive
    elseif ypred(i) == 1 && yactual(i) == 0
        b = b + 1; % False Positive
    elseif ypred(i) == 0 && yactual(i) == 1
        c = c + 1; % False Negative
    elseif ypred(i) == 0 && yactual(i) == 0
        d = d + 1; % True Negative
    end
end

CON = [a c; d b]; % Confusion matrix
A = ((a + b) / (a + b + c + d)) * 100; % Accuracy
P = a / (a + b); % Precision
R = a / (a + d); % Recall
F1 = 2 * P * R / (P + R); % F1 score

end